import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  ObservableList<String> todos = ObservableList();

  @observable
  TextEditingController todo = TextEditingController();

  @action
  addTodo() {
    todos.add(todo.text);
  }
}
