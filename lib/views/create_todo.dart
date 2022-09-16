import 'package:flutter/material.dart';
import 'package:template/constants.dart';

class CreateTodoView extends StatelessWidget {
  const CreateTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                    hintText: 'What are you going to do?',
                    border: OutlineInputBorder()),
              ),
              TextButton.icon(
                  onPressed: (() {
                    print('submit');
                  }),
                  icon: const Icon(Icons.add),
                  label: const Text('ADD')),
            ])));
  }
}
