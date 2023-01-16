import 'package:flutter/material.dart';
import 'package:multiple_state_menagement/blocs/todo_events.dart';
import 'package:multiple_state_menagement/blocs/todo_state.dart';
import 'package:multiple_state_menagement/widgets/add_todo_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo_bloc.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late final TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TodoBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

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
            BlocBuilder<TodoBloc, TodoState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is TodoListInitialState) {
                    return const Center(
                      child: Text('Add a Todo'),
                    );
                  } else if (state is TodoSuccessState) {
                    return ListView.builder(
                      itemCount: state.todos.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.todos[index],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              bloc.add(
                                  RemoveTodoEvent(todo: state.todos[index]));
                            },
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddTodoDialog(
                        bloc: bloc,
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
