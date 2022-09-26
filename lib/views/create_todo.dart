import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/constants.dart';
import 'package:template/data/todos.dart';

class CreateTodoView extends StatelessWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                    hintText: 'What are you going to do?',
                    border: OutlineInputBorder()),
                autofocus: true,
                onSubmitted: (value) => submitTodo(context, value),
              ),
              TextButton.icon(
                  onPressed: () => submitTodo(context, textController.text),
                  icon: const Icon(Icons.add),
                  label: const Text('ADD')),
            ])));
  }

  void submitTodo(BuildContext context, String value) {
    Provider.of<Todos>(context, listen: false).createTodo(value);
    Navigator.pop(context);
  }
}
