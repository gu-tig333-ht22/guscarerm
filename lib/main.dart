import 'package:flutter/material.dart';
import 'package:template/constants.dart';
import 'package:template/views/todos.dart';

void main() {
  runApp(const MyApp());
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
      home: const TodosView(),
    );
  }
}
