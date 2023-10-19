part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final List<NotificationEntity>? listNotification;

  @override
  List<Object?> get props => [
    listNotification,
  ];

  const NotificationState({
    this.listNotification,
  });

  NotificationState copyWith({
    List<NotificationEntity>? listNotification,
  }) {
    return NotificationState(
      listNotification: listNotification ?? this.listNotification,
    );
  }
}