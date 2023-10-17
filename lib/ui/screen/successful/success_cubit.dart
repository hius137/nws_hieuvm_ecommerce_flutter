import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_screen.dart';

part 'success_state.dart';

class SuccessfulCubit extends Cubit<SuccessfulState> {
  SuccessfulCubit() : super(SuccessfulState());

  void navHome(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const HomeScreen(),
      ),
    );
  }
}
