import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/samples/bloc_todo/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState(todos: [])) {
    on<TodoEventInsert>((event, emit) {
      emit(state.copyWith(todos: [
        ...state.todos,
        Todo.newDefaultTodo(),
      ]));
    });

    on<TodoEventRemove>((event, emit) {
      var todos = state.todos;
      todos.removeWhere((element) => element.id == event.removedId);
      emit(state.copyWith(todos: todos));
    });

    on<TodoEventReset>((event, emit) {
      var todos = List.generate(10, (index) => Todo.newDefaultTodo());
      emit(state.copyWith(todos: todos));
    });

    on<TodoEventUpdate>((event, emit) {
      var todos = state.todos
          .map((e) =>
              e.id == event.id ? Todo(id: event.id, title: event.title) : e)
          .toList();
      emit(state.copyWith(todos: todos));
    });
  }
}
