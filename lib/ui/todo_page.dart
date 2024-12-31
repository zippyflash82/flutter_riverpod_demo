import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/providers/todo_provider.dart';
import 'package:flutter_riverpod_demo/ui/widgets/todo_view.dart';
import '../data/models/todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<TodoModel> todos = ref.watch(toDoProvider);
    final todoController = TextEditingController();

    void onAdd(String value) {
      if (value.isNotEmpty) {
        ref.read(toDoProvider.notifier).add(value);
        todoController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a to do'),
          ),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('To Do Page'),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter a new to do',
                  ),
                  controller: todoController,
                  onSubmitted: (value) => onAdd(value),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () => onAdd(todoController.text),
                    child: Text('Add New To Do')),
                Expanded(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return TodoView(todo: todo);
                    },
                  ),
                ),
              ],
            )));
  }
}
