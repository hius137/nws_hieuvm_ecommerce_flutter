part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final List<NotificationEntity>? listNotification;
  final LoadStatus notificationStatus;

  @override
  List<Object?> get props => [
    listNotification,
    notificationStatus,
  ];

  const NotificationState({
    this.listNotification,
    this.notificationStatus = LoadStatus.initial,
  });

  NotificationState copyWith({
    List<NotificationEntity>? listNotification,
    LoadStatus? notificationStatus,
  }) {
    return NotificationState(
      listNotification: listNotification ?? this.listNotification,
      notificationStatus: notificationStatus ?? this.notificationStatus,
    );
  }
}