// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStoreBase, Store {
  late final _$todoAtom = Atom(name: '_TodoStoreBase.todo', context: context);

  @override
  TextEditingController get todo {
    _$todoAtom.reportRead();
    return super.todo;
  }

  @override
  set todo(TextEditingController value) {
    _$todoAtom.reportWrite(value, super.todo, () {
      super.todo = value;
    });
  }

  late final _$_TodoStoreBaseActionController =
      ActionController(name: '_TodoStoreBase', context: context);

  @override
  dynamic addTodo() {
    final _$actionInfo = _$_TodoStoreBaseActionController.startAction(
        name: '_TodoStoreBase.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_TodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todo: ${todo}
    ''';
  }
}
