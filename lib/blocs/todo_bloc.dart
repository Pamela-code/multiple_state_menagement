import 'package:bloc/bloc.dart';
import 'package:multiple_state_menagement/blocs/todo_events.dart';
import 'package:multiple_state_menagement/blocs/todo_state.dart';
import 'package:multiple_state_menagement/repositories/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _todoRepo = TodoRepository();

  TodoBloc() : super(TodoListInitialState()) {
    on<AddTodoEvent>(
      (event, emit) =>
          emit(TodoSuccessState(todos: _todoRepo.addTodo(event.todo))),
    );

    on<RemoveTodoEvent>(
      (event, emit) =>
          emit(TodoSuccessState(todos: _todoRepo.removeTodo(event.todo))),
    );
  }
}
