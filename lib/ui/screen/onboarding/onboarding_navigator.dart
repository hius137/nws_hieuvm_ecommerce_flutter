import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/auth/auth_page.dart';

class OnboardingNavigator extends AppNavigator{
  OnboardingNavigator({required BuildContext context}) : super(context: context);

  void navLogin()  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const AuthPage(),
      ),
    );
  }
}