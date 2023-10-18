import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setProfileUser(UserEntity userEntity) {
    try{
      emit(state.copyWith(
        userEntity: userEntity,
      ));
    }catch(e){
      print('err setProfile =>> $e');
    }
  }

}