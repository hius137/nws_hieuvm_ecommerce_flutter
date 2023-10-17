import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/auth/auth_screen.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  // PageController pageController = PageController();
  // void onChangedPage(value){
  //   int currentIndex = value;
  //   emit(state.copyWith(
  //     curlIndex: currentIndex,
  //   ));
  // }

  void navLogin(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const AuthScreen(),
      ),
    );
  }
}
