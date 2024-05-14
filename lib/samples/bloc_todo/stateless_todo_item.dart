import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo.dart';
import 'todo_bloc.dart';

typedef VoidCallback = void Function();

class StatelessTodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback voidCallback;

  const StatelessTodoItem({super.key, required this.todo, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(todo.id.toString()),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(todo.title),
            ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 50), () {
                    context.read<TodoBloc>().add(
                        TodoEventUpdate(id: todo.id, title: '${todo.title}☆'));
                  });
                },
                child: const Icon(Icons.update))
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<TodoBloc>().add(TodoEventRemove(todo.id));
        voidCallback();
      },
    );
  }
}
