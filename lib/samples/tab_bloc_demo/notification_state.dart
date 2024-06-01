part of 'notification_bloc.dart';

final class NotificationState extends Equatable {
  final List<NotificationEntity> notifications;

  @override
  List<Object> get props => [notifications];

  const NotificationState({
    required this.notifications,
  });

  NotificationState copyWith({
    List<NotificationEntity>? notifications,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }
}
