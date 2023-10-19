import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/notification_entity.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());
  final FireStoreService fireStoreService = FireStoreService();

  void getListNotification(int id) async{
    try{
      await Future.delayed(const Duration(seconds: 1));
      final responseListNotification = await fireStoreService.getNotification(id);
      emit(state.copyWith(
        listNotification: responseListNotification,
      ));
    }catch(e){
      print('err $e');
    }
  }
}
