import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());
  PageController pageController = PageController();

  void switchTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    emit(state.copyWith(curlIndex: index));
  }
}
