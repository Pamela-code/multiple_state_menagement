import 'package:flutter/material.dart';

import '../store/todo_store.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key, required this.store});
  final TodoStore store;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New todo'),
      content: TextField(
        controller: store.todo,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            store.addTodo();
            store.todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
        ElevatedButton(
          onPressed: () {
            store.todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
