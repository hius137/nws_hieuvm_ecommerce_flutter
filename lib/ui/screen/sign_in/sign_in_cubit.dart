import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/success/success_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_snackbar.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AppCubit appCubit;
  SignInCubit({required this.appCubit}) : super(const SignInState());

  void signIn(BuildContext context, String email, String password) async {
    emit(state.copyWith(signInStatus: LoadStatus.loading));
    try {
      if(email.isEmpty || password.isEmpty){
        showSnackBar(context, 'Email or Password is empty');
      }else {
        final responseSignIn = await signInRequest(email, password);
        if (responseSignIn != null && responseSignIn.accessToken.isNotEmpty) {
          SharedPreferencesHelper.setAccessToken(responseSignIn.accessToken);
          final userEntity = await getProfileUser(responseSignIn.accessToken);
          appCubit.setProfileUser(userEntity);
          Future.delayed(const Duration(milliseconds: 200)).then((value) {
            showSnackBar(context, 'Sign in success!');
            emit(state.copyWith(
              signInStatus: LoadStatus.success,
            ),);
          });
        }else {
          // ignore: use_build_context_synchronously
          showSnackBar(context, 'Wrong email or password');
        }
      }
    } catch (e) {
      print('sign in =>>> $e');
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
  }

  void navAuth(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SuccessPage(),
      ),
    );
  }

  void navSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }
}

