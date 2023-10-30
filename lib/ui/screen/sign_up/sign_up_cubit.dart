import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_snackbar.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void signUp(BuildContext context, String name, String email, String password, String confirmPassword) async{
    emit(state.copyWith(signUpStatus: LoadStatus.loading));
    try{
      if(email.isEmpty){
        showSnackBar(context, 'Email is empty');
        emit(state.copyWith(
          signUpStatus: LoadStatus.failure
        ));
      }else if(password.isEmpty){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        showSnackBar(context, 'Password is empty');
      }else if(name.isEmpty){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        showSnackBar(context, 'Name is empty');
      }else if(password != confirmPassword){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        showSnackBar(context, 'Password must be the same');
      }else if(state.isChecked == false){
        emit(state.copyWith(
            signUpStatus: LoadStatus.failure
        ));
        showSnackBar(context, 'Please accept our terms and conditions');
      }else{
        final responseSignUp = await signUpRequest(name, email, password);
        emit(state.copyWith(
            userEntity: responseSignUp,
            signUpStatus: LoadStatus.success
        ));
        showSnackBar(
          context,
          'Sign up success!',
        );
      }
    }
    catch (e){
      emit(state.copyWith(signUpStatus: LoadStatus.failure));
    }
  }

  void isUserChecked(bool isChecked){
    emit(state.copyWith(isChecked: !state.isChecked, checkStatus: LoadStatus.success));
  }

  void navAuth(BuildContext context)  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const SignInPage(),
      ),
    );
  }
}
