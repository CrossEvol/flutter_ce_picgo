part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();
}

final class NotificationEventAdd extends NotificationEvent {
  @override
  List<Object?> get props => [];

  const NotificationEventAdd();
}
