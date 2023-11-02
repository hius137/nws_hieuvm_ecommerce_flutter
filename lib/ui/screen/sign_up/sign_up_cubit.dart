import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.navigator}) : super(const SignUpState());
  final SignUpNavigator navigator;

  void signUp(BuildContext context, String name, String email, String password, String confirmPassword) async{
    emit(state.copyWith(signUpStatus: LoadStatus.loading));
    try{
      if(email.isEmpty && password.isEmpty && name.isEmpty){
        navigator.showErrorFlushbar(message: 'Please enter your information');
        emit(state.copyWith(
          signUpStatus: LoadStatus.failure
        ));
      }else if(email.isEmpty){
        navigator.showErrorFlushbar(message: 'Email is empty');
        emit(state.copyWith(
          signUpStatus: LoadStatus.failure
        ));
      }else if(password.isEmpty){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        navigator.showErrorFlushbar(message: 'Password is empty');
      }else if(name.isEmpty){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        navigator.showErrorFlushbar(message: 'Name is empty');
      }else if(password != confirmPassword){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        navigator.showErrorFlushbar(message: 'Password must be the same');
      }else if(state.isChecked == false){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        navigator.showErrorFlushbar(message: 'Please accept our terms and conditions');
      }else{
        final responseSignUp = await signUpRequest(name, email, password);
        if(responseSignUp != null){
          emit(state.copyWith(
              userEntity: responseSignUp,
              signUpStatus: LoadStatus.success
          ));
          navigator.showSuccessFlushbar(message: 'Sign up success!');
        }else{
          emit(state.copyWith(
              signUpStatus: LoadStatus.failure
          ));
          navigator.showErrorFlushbar(message: 'Sign up error!');
        }
      }
    }
    catch (e){
      emit(state.copyWith(signUpStatus: LoadStatus.failure));
    }
  }
  void isUserChecked(bool isChecked){
    emit(state.copyWith(isChecked: !state.isChecked, checkStatus: LoadStatus.success));
  }

}
