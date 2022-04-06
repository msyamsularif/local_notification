import 'package:flutter/material.dart';

class ModelNotification {
  final String id;
  final String title;
  final String subTitle;
  final String dateTime;
  final bool? isRead;
  final VoidCallback onPressed;
  final VoidCallback? onDeleted;

  ModelNotification({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    this.isRead = false,
    required this.onPressed,
    this.onDeleted,
  });

  ModelNotification copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? dateTime,
    bool? isRead,
    VoidCallback? onPressed,
    VoidCallback? onDeleted,
  }) {
    return ModelNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      dateTime: dateTime ?? this.dateTime,
      isRead: isRead ?? this.isRead,
      onPressed: onPressed ?? this.onPressed,
      onDeleted: onDeleted ?? this.onDeleted,
    );
  }

  @override
  String toString() {
    return 'ModelNotification(id: $id, title: $title, subTitle: $subTitle, dateTime: $dateTime, isRead: $isRead, onPressed: $onPressed, onDeleted: $onDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelNotification &&
        other.id == id &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.dateTime == dateTime &&
        other.isRead == isRead &&
        other.onPressed == onPressed &&
        other.onDeleted == onDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subTitle.hashCode ^
        dateTime.hashCode ^
        isRead.hashCode ^
        onPressed.hashCode ^
        onDeleted.hashCode;
  }
}
