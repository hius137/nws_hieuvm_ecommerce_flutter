import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_page.dart';

class SignUpNavigator extends AppNavigator{
  SignUpNavigator({required BuildContext context}) : super(context: context);

  void navSignIn()  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignInPage(),
      ),
    );
  }
}