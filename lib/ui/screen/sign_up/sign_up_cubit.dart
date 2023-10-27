import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void signUp(String name, String email, String password) async{
    emit(state.copyWith(signUpStatus: LoadStatus.loading));
    try{
      final responseSignUp = await signUpRequest(name, email, password);
      emit(state.copyWith(
        userEntity: responseSignUp,
        signUpStatus: LoadStatus.success
      ));
    }
    catch (e){
      emit(state.copyWith(signUpStatus: LoadStatus.failure));
    }
  }

  void isUserChecked(bool isChecked){
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void navAuth(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignInScreen(),
      ),
    );
  }
}
