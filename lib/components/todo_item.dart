import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data/todos.dart';

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
              children: [
                Checkbox(
                    value: todo.done,
                    onChanged: (bool? value) {
                      Provider.of<Todos>(context, listen: false)
                          .updateTodo(index, done: value ?? false);
                    }),
                Text(
                  todo.title,
                  style: TextStyle(
                      decoration:
                          todo.done ? TextDecoration.lineThrough : null),
                ),
              ],
            ),
            IconButton(
                onPressed: (() {
                  Provider.of<Todos>(context, listen: false).deleteTodo(index);
                }),
                icon: const Icon(Icons.close))
          ],
        ));
  }
}
