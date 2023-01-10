import 'package:flutter/widgets.dart';

class TodoController extends ChangeNotifier {
  final TextEditingController todo = TextEditingController();
  final List<String> _todos = [];

  List<String> get todos => _todos;

  addTodo() {
    _todos.add(todo.text);
    notifyListeners();
  }

  removeTodo(index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}


// import 'package:flutter/widgets.dart';
// import 'package:mobx/mobx.dart';
// part 'todo_store.g.dart';

// class TodoStore = _TodoStoreBase with _$TodoStore;

// abstract class _TodoStoreBase with Store {
//   ObservableList<String> todos = ObservableList();

//   @observable
//   TextEditingController todo = TextEditingController();

//   @action
//   addTodo() {
//     todos.add(todo.text);
//   }
// }
