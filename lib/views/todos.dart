import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        actions: const <Widget>[FilterMenu()],
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

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => ['all', 'done', 'undone']
          .map((entry) => PopupMenuItem(
                value: entry,
                child: Text(entry),
              ))
          .toList(),
      onSelected: (String value) {
        Provider.of<Todos>(context, listen: false).filteredBy = value;
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  final int index;
  final Todo todo;

  const TodoItem(this.index, this.todo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Checkbox(
                    value: todo.done,
                    onChanged: (bool? value) {
                      Provider.of<Todos>(context, listen: false)
                          .toggleDone(index);
                    }),
                Text(
                  todo.name,
                  style: TextStyle(
                      decoration:
                          todo.done ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            IconButton(
                onPressed: (() {
                  Provider.of<Todos>(context, listen: false).removeTodo(index);
                }),
                icon: const Icon(Icons.close))
          ],
        ));
  }
}
