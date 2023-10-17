import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  void signUp(String name, String email, String password) async{
    try{
      final responseSignUp = await signUpRequest(name, email, password);
      emit(state.copyWith(
        userEntity: responseSignUp,
      ));
    }
    catch (e){
      print("+>>>> error data signup$e");
    }
  }

  void isUserChecked(bool isChecked){
    emit(state.copyWith(isChecked: isChecked));
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
