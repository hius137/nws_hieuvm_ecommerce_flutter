import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_navigator.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.navigator}) : super(const MainState());
  PageController pageController = PageController();
  final MainNavigator navigator;

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

  void onWillPop(){
    navigator.onWillPop();
  }
}
