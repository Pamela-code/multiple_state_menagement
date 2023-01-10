import 'package:flutter/material.dart';
import 'package:multiple_state_menagement/controller/todo_controller.dart';
import 'package:multiple_state_menagement/widgets/add_todo_dialog.dart';
import 'package:provider/provider.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My todo list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<TodoController>(
          builder: (BuildContext context, TodoController value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  itemCount: value.todos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        value.todos[index],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.close,
                        ),
                        onPressed: () {
                          value.removeTodo(index);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddTodoDialog(
                            value: value,
                          );
                        },
                      );
                    },
                    child: const Text('Add todo'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
