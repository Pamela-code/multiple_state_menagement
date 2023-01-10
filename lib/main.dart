import 'package:flutter/material.dart';
import 'package:multiple_state_menagement/controller/todo_controller.dart';
import 'package:multiple_state_menagement/pages/todo_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ChangeNotifierProvider(
        child: const TodoListPage(),
        create: (context) => TodoController(),
      ),
    );
  }
}
