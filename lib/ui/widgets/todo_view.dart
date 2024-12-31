import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/data/models/todo.dart';

import '../../providers/todo_provider.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.description),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          ref.read(toDoProvider.notifier).toggle(todo.id);
        },
      ),
      onLongPress: () {
        ref.read(toDoProvider.notifier).remove(todo.id);
      },
    );
  }
}
