import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/onboarding/onboarding_navigator.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({required this.navigator}) : super(const OnboardingState());
  final OnboardingNavigator navigator;

}
