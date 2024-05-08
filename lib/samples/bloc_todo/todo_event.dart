part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {

  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class TodoEventInsert extends TodoEvent {

}

final class TodoEventReset extends TodoEvent {

}

final class TodoEventRemove extends TodoEvent {

  final int removedId;

  const TodoEventRemove(this.removedId);

  @override
  List<Object> get props => [removedId];
}
