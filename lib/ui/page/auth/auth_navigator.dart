import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_up/sign_up_page.dart';

class AuthNavigator extends AppNavigator{
  AuthNavigator({required BuildContext context}) : super(context: context);

  void navSignIn()  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignInPage(),
      ),
    );
  }
  void navSignUp()  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignUpPage(),
      ),
    );
  }
}