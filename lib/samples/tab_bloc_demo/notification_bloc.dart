import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'notification.dart';

part 'notification_event.dart';

part 'notification_state.dart';

var notificationIndex = 0;

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc()
      : super(
           const NotificationState(notifications: []),
        ) {
    on<NotificationEventAdd>((event, emit) {
      notificationIndex++;
      emit(state.copyWith(notifications: [
        ...state.notifications,
        NotificationEntity(
            id: notificationIndex,
            title: 'Notification $notificationIndex',
            subTitle: 'This is a notification#$notificationIndex')
      ]));
    });

    on<NotificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
