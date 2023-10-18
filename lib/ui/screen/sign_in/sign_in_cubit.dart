import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/successful/success_sceen.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AppCubit appCubit;
  SignInCubit({required this.appCubit}) : super(const SignInState());

  void signIn(String email, String password) async {
    emit(state.copyWith(signInStatus: LoadStatus.loading));
    try {
      final responseSignIn = await signInRequest(email, password);
      if (responseSignIn != null && responseSignIn.accessToken.isNotEmpty) {
        SharedPreferencesHelper.setAccessToken(responseSignIn.accessToken);
        final userEntity = await getProfileUser(responseSignIn.accessToken);
        appCubit.setProfileUser(userEntity);
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          emit(state.copyWith(
            signInStatus: LoadStatus.success,
          ));
        });
      }
    } catch (e) {
      print('sign in =>>> $e');
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
  }

  void navAuth(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SuccessScreen(),
      ),
    );
  }

  void navSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}

