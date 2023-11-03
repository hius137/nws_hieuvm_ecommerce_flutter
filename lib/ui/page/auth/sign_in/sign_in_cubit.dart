import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInNavigator navigator;
  final AppCubit appCubit;

  SignInCubit({required this.appCubit, required this.navigator}) : super(const SignInState());

  void signIn(BuildContext context, String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        navigator.showErrorFlushBar(message: 'Email or Password is empty');
      } else {
        final responseSignIn = await signInRequest(email, password);
        if (responseSignIn != null && responseSignIn.accessToken.isNotEmpty) {
          emit(state.copyWith(signInStatus: LoadStatus.loading));
          SharedPreferencesHelper.setAccessToken(responseSignIn.accessToken);
          final userEntity = await getProfileUser(responseSignIn.accessToken);
          appCubit.setProfileUser(userEntity);
          emit(
            state.copyWith(
              signInStatus: LoadStatus.success,
            ),
          );
          navigator.navSuccessPage();
        } if(responseSignIn == null) {
          navigator.showErrorFlushBar(message: 'Wrong email or password');
          emit(state.copyWith(signInStatus: LoadStatus.failure));
        }
      }
    } catch (e) {
      logger.e('sign up page: $e');
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
  }
}
