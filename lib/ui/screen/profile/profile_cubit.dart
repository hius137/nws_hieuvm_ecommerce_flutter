import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.appCubit}) : super(const ProfileState());
  final AppCubit appCubit;

  Future<void> getUser() async {
    emit(
      state.copyWith(loadStatus: LoadStatus.loading),
    );
    try {
      if (appCubit.state.userEntity != null) {
        emit(state.copyWith(
          user: appCubit.state.userEntity,
          loadStatus: LoadStatus.success,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(loadStatus: LoadStatus.failure),
      );
    }
  }

  Future<void> signOut() async {
    try{
      SharedPreferencesHelper.removeAccessToken();
      appCubit.signOut();
    }catch(e){
      logger.e(e);
    }
  }

  void navSignIn(BuildContext context)  {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
        const SignInPage(),
      ),
    );
  }
}
