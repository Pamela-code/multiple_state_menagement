import 'package:flutter/material.dart';
import 'package:multiple_state_menagement/controller/todo_controller.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key, required this.value});
  final TodoController value;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New todo'),
      content: TextField(
        controller: value.todo,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            value.addTodo();
            value.todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
        ElevatedButton(
          onPressed: () {
            value.todo.clear();
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
