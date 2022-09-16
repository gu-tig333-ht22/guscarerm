import 'package:flutter/material.dart';
import 'package:template/constants.dart';
import 'package:template/views/create_todo.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        centerTitle: true,
        actions: <Widget>[_filterMenu()],
      ),
      body: ListView(children: <Widget>[
        // Placeholder items
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
        _todoItem(context, "test1", false),
        _todoItem(context, "test2", true),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateTodoView())),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _filterMenu() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => ['all', 'done', 'undone']
          .map((entry) => PopupMenuItem(
                value: entry,
                child: Text(entry),
              ))
          .toList(),
      onSelected: (String value) {
        print(value);
      },
    );
  }

  Widget _todoItem(BuildContext context, String name, bool done) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Theme.of(context).primaryColor))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: <Widget>[
            Checkbox(
                value: done,
                onChanged: (bool? value) {
                  print(value);
                }),
            Text(
              name,
              style: TextStyle(
                  decoration: done ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
                onPressed: (() {
                  print('delete');
                }),
                icon: const Icon(Icons.close))
          ],
        )
      ]),
    );
  }
}
