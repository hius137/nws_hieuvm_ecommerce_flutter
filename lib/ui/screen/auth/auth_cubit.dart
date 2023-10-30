import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_page.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  void navSignIn(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignInPage(),
      ),
    );
  }
  void navSignUp(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignUpPage(),
      ),
    );
  }
}
