import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/filter_menu.dart';
import 'package:template/components/todo_item.dart';
import 'package:template/constants.dart';
import 'package:template/data/todos.dart';
import 'package:template/views/create_todo.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        centerTitle: true,
        actions: const [FilterMenu()],
      ),
      body: Consumer<Todos>(builder: (context, todos, widget) {
        List<Todo> filteredTodos = _filterList(todos.todos, todos.filteredBy);
        return ListView.builder(
          itemCount: filteredTodos.length,
          itemBuilder: (context, index) =>
              TodoItem(index, filteredTodos[index]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateTodoView())),
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Todo> _filterList(List<Todo> todos, String filterBy) {
    switch (filterBy) {
      case 'done':
        return todos.where((element) => (element.done == true)).toList();
      case 'undone':
        return todos.where((element) => (element.done == false)).toList();
      default:
        return todos;
    }
  }
}
