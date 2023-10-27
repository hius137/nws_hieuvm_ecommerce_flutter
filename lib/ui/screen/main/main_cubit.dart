import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());
  PageController pageController = PageController();

  void onPageChange(int index) {
    int currentIndex = index;
    pageController.jumpToPage(
      currentIndex,
    );
    emit(
      state.copyWith(
        curlIndex: currentIndex,
      ),
    );
  }
  void onIndexChange(int index) {
    int currentIndex = index;
    emit(
      state.copyWith(
        curlIndex: currentIndex,
      ),
    );
  }
}
