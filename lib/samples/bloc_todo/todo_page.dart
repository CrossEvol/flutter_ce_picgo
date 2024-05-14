import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/samples/bloc_todo/stateful_todo_item.dart';
import 'package:flutter_ce_picgo/samples/bloc_todo/stateless_todo_item.dart';
import 'package:flutter_ce_picgo/samples/bloc_todo/todo_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  _TodoPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.read<TodoBloc>().add(TodoEventInsert());
          },
        ),
        appBar: AppBar(
          title: const Text('Generated List'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(TodoEventReset());
                  },
                  icon: const Icon(Icons.refresh_rounded)),
            )
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text('Empty List.'),
              );
            }

            return ListView.builder(
              itemCount: state.todos.length,
              prototypeItem: ListTile(
                title: Text(state.todos.first.title),
              ),
              itemBuilder: (context, index) {
                // Future.delayed(const Duration(seconds: 3), () {
                //   context.read<TodoBloc>().add(TodoEventUpdate(
                //       id: state.todos[index].id,
                //       title: '${state.todos[index].title}☆'));
                // });

                return StatelessTodoItem(todo: state.todos[index]);

                // return StatefulTodoItem(todo: state.todos[index]);

                // return Dismissible(
                //   background: Container(
                //     color: Colors.red,
                //   ),
                //   key: Key(state.todos[index].id.toString()),
                //   child: ListTile(
                //     title: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(state.todos[index].title),
                //         ElevatedButton(
                //             onPressed: () {
                //               Future.delayed(const Duration(milliseconds: 50),
                //                   () {
                //                 context.read<TodoBloc>().add(TodoEventUpdate(
                //                     id: state.todos[index].id,
                //                     title: '${state.todos[index].title}☆'));
                //               });
                //             },
                //             child: const Icon(Icons.update))
                //       ],
                //     ),
                //   ),
                //   onDismissed: (direction) {
                //     context
                //         .read<TodoBloc>()
                //         .add(TodoEventRemove(state.todos[index].id));
                //     Future.delayed(const Duration(milliseconds: 1), () {
                //       setState(() {});
                //     });
                //   },
                // );
              },
            );
          },
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
