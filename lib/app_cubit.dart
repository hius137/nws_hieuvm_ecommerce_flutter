import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setProfileUser(UserEntity userEntity) {
    try {
      emit(
        state.copyWith(
          userEntity: userEntity,
        ),
      );
    } catch (e) {
      logger.e(e);    }
  }

  void signOut() async {
    try{
      await Future.delayed(const Duration(seconds: 1));
      emit(state.removeUser());
    }catch(e){
      logger.e(e);    }

  }
}
