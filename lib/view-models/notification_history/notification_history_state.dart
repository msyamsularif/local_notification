part of 'notification_history_cubit.dart';

class NotificationHistoryState extends Equatable {
  final List<ModelNotification> notifications;
  final bool isDelete;
  final bool isAdded;
  final bool isUpdate;

  const NotificationHistoryState({
    required this.notifications,
    this.isDelete = false,
    this.isAdded = false,
    this.isUpdate = false,
  });

  @override
  List<Object> get props => [notifications, isDelete, isAdded, isUpdate];

  NotificationHistoryState copyWith({
    List<ModelNotification>? notifications,
    bool? isDelete,
    bool? isAdded,
    bool? isUpdate,
  }) {
    return NotificationHistoryState(
      notifications: notifications ?? this.notifications,
      isDelete: isDelete ?? this.isDelete,
      isAdded: isAdded ?? this.isAdded,
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }
}
