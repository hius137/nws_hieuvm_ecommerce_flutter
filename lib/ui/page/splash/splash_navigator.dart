import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/auth_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/main/main_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/onboarding/onboarding_page.dart';

class SplashNavigator extends AppNavigator{
  SplashNavigator({required BuildContext context}) : super(context: context);

  void navAuth() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  void navOnboardingPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }

  void navMainPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }
}