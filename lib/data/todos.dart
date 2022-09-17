import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:template/constants.dart';

class Api {
  static Future<List<Todo>> getTodos() async {
    http.Response res =
        await http.get(Uri.https(apiHost, 'todos', {'key': apiKey}));
    List<dynamic> data = jsonDecode(res.body);
    return data.map((e) => Todo.fromJson(e)).toList();
  }

  static Future<Todo> createTodo(String title) async {
    http.Response res = await http.post(
        Uri.https(apiHost, 'todos', {'key': apiKey}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'title': title, 'done': false}));
    // The api endpoint returns the entire list of todos, so pick only the last
    // (new) element
    return Todo.fromJson(jsonDecode(res.body).last);
  }

  static Future<void> deleteTodo(String id) async {
    await http.delete(Uri.https(apiHost, 'todos/$id', {'key': apiKey}));
  }

  static Future<void> updateTodo(String id, Todo todo) async {
    await http.put(Uri.https(apiHost, 'todos/$id', {'key': apiKey}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'title': todo.title, 'done': todo.done}));
  }
}

class Todo {
  String id;
  String title;
  bool done;

  Todo({required this.id, required this.title, required this.done});

  factory Todo.fromJson(dynamic json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      done: json['done'] as bool,
    );
  }
}

class Todos extends ChangeNotifier {
  List<Todo> _todos = [];
  String _filteredBy = 'all';

  Todos() {
    (() async {
      _todos = await Api.getTodos();
      notifyListeners();
    })();
  }

  List<Todo> get todos => _todos;

  String get filteredBy => _filteredBy;

  set filteredBy(String value) {
    _filteredBy = value;
    notifyListeners();
  }

  void createTodo(String title) async {
    Todo todo = await Api.createTodo(title);
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int index) async {
    Api.deleteTodo(_todos[index].id);
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, {required bool done}) async {
    Todo updatedTodo =
        Todo(id: _todos[index].id, title: _todos[index].title, done: done);
    Api.updateTodo(updatedTodo.id, updatedTodo);
    _todos[index] = updatedTodo;
    notifyListeners();
  }
}
