import 'package:flutter/material.dart';
import 'package:multiple_state_menagement/store/todo_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multiple_state_menagement/widgets/add_todo_dialog.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoStore store = TodoStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My todo list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(builder: (_) {
              return ListView.builder(
                itemCount: store.todos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      store.todos[index],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.close,
                      ),
                      onPressed: () {
                        store.todos.removeAt(index);
                      },
                    ),
                  );
                },
              );
            }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddTodoDialog(
                        store: store,
                      );
                    },
                  );
                },
                child: const Text('Add todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
