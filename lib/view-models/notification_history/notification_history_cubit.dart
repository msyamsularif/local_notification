import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/notification_model.dart';

part 'notification_history_state.dart';

class NotificationHistoryCubit extends Cubit<NotificationHistoryState> {
  NotificationHistoryCubit()
      : super(const NotificationHistoryState(notifications: []));

  final List<ModelNotification> listNotification = [];

  void addNotification(ModelNotification notification) {
    emit(state.copyWith(isAdded: false));

    listNotification.add(notification);

    emit(state.copyWith(
      notifications: listNotification,
      isAdded: true,
      isDelete: false,
      isUpdate: false,
    ));
  }

  void updateNotification(String id) {
    emit(state.copyWith(isUpdate: false));

    final index = listNotification.indexWhere((e) => e.id == id);

    listNotification[index] = state.notifications[index].copyWith(
      isRead: true,
    );

    emit(state.copyWith(
      notifications: listNotification,
      isAdded: false,
      isDelete: false,
      isUpdate: true,
    ));
  }

  void deleteNotification(ModelNotification notification) {
    emit(state.copyWith(isDelete: false));
    final index = listNotification.indexWhere((e) => e.id == notification.id);
    listNotification.removeAt(index);

    emit(state.copyWith(
      notifications: listNotification,
      isAdded: false,
      isDelete: true,
      isUpdate: false,
    ));
  }
}
