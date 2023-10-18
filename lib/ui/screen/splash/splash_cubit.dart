import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/auth/auth_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/onboarding/onboarding_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.appCubit}) : super(const SplashState());
  final AppCubit appCubit;

  void checkLogin(context) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await SharedPreferencesHelper.getAccessToken();
    if (token == null) {
      bool checkOnboard = await SharedPreferencesHelper.getOnboard();
      if (checkOnboard) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      }
    } else {
      final userEntity = await getProfileUser(token);
      appCubit.setProfileUser(userEntity);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }
}
