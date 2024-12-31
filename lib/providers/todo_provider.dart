import 'package:flutter_riverpod_demo/data/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class ToDo extends _$ToDo {
  @override
  List<TodoModel> build() => [];

  void add(String description) {
    state = [
      ...state,
      TodoModel(
        id: DateTime.now().toIso8601String(),
        description: description,
        completed: false,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
