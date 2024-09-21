part of 'todo_bloc.dart';

final class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({
    required this.todos,
  });


  TodoState copyWith({
    List<Todo>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [todos];

}
