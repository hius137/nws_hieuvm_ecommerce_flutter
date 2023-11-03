import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/splash/splash_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.appCubit, required this.navigator}) : super(const SplashState());
  final AppCubit appCubit;
  final SplashNavigator navigator;

  void checkLogin(context) async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await SharedPreferencesHelper.getAccessToken();
    if (token == null) {
      bool checkOnboard = await SharedPreferencesHelper.getOnboard();
      if (checkOnboard) {
        navigator.navAuth();
      } else {
        navigator.navOnboardingPage();
      }
    } else {
      final userEntity = await getProfileUser(token);
      appCubit.setProfileUser(userEntity);
      navigator.navMainPage();
    }
  }
}
