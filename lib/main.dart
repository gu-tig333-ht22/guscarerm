import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/constants.dart';
import 'package:template/data/todos.dart';
import 'package:template/views/todos.dart';

void main() {
  Todos todos = Todos();

  runApp(ChangeNotifierProvider(
      create: ((context) => todos), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const TodosView());
  }
}
