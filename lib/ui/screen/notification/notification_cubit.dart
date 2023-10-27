import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/notification_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());
  final FireStoreService fireStoreService = FireStoreService();

  void getListNotification(int id) async {
    emit(state.copyWith(notificationStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 1));
      final responseListNotification =
          await fireStoreService.getNotification(id);
      emit(state.copyWith(
          listNotification: responseListNotification,
          notificationStatus: LoadStatus.success));
    } catch (e) {
      print('err $e');
      emit(state.copyWith(notificationStatus: LoadStatus.failure));
    }
  }

  String formatTimeAgo(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);
    if (difference.inSeconds < 60) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      return "${difference.inSeconds} second ago";
    } else if (difference.inMinutes < 60) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      return "${difference.inMinutes} minute ago";
    } else if (difference.inHours < 24) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      return "${difference.inHours} hour ago";
    } else if (difference.inDays < 7) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      return "${difference.inDays} day ago";
    } else if (difference.inDays < 30) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      int weeks = (difference.inDays / 7).floor();
      return "$weeks week ago";
    } else if (difference.inDays < 365) {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      int months = (difference.inDays / 30).floor();
      return "$months month ago";
    } else {
      emit(
        state.copyWith(
          notificationStatus: LoadStatus.success,
        ),
      );
      int years = (difference.inDays / 365).floor();
      return "$years year ago";
    }
  }
}
