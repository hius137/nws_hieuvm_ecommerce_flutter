import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_page.dart';

class ProfileNavigator extends AppNavigator {
  ProfileNavigator({required BuildContext context}) : super(context: context);

  void navSignIn() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignInPage(),
        ),
        (Route<dynamic> route) => false);
  }
  void closeDialog() {
    Navigator.of(context).pop(context);
  }
}
