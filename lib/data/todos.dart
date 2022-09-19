import 'package:flutter/foundation.dart';

class Todo {
  String name;
  bool done;

  Todo({required this.name, required this.done});
}

class Todos extends ChangeNotifier {
  final List<Todo> _todos = [];
  String _filteredBy = 'all';

  List<Todo> get todos => _todos;

  String get filteredBy => _filteredBy;

  set filteredBy(String value) {
    _filteredBy = value;
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void toggleDone(int index) {
    _todos[index].done = !_todos[index].done;
    notifyListeners();
  }
}
