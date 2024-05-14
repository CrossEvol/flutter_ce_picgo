part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

final class TodoEventInsert extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class TodoEventReset extends TodoEvent {
  @override
  List<Object?> get props => [];
}

final class TodoEventUpdate extends TodoEvent {
  int id;

  String title;

  TodoEventUpdate({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}

final class TodoEventRemove extends TodoEvent {
  final int removedId;

  const TodoEventRemove(this.removedId);

  @override
  List<Object> get props => [removedId];
}
