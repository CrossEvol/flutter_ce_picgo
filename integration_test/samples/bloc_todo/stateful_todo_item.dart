import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo.dart';
import 'todo_bloc.dart';

class StatefulTodoItem extends StatefulWidget {
  final Todo todo;

  const StatefulTodoItem({super.key, required this.todo});

  @override
  State<StatefulTodoItem> createState() => _StatefulTodoItemState();
}

class _StatefulTodoItemState extends State<StatefulTodoItem> {
  _StatefulTodoItemState();

  late int id;
  late String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(id.toString()),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 50), () {
                    context
                        .read<TodoBloc>()
                        .add(TodoEventUpdate(id: id, title: '$title☆'));
                  });
                },
                child: const Icon(Icons.update))
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<TodoBloc>().add(TodoEventRemove(id));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    id = widget.todo.id;
    title = widget.todo.title;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
