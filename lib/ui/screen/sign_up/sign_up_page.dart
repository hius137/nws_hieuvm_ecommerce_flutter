import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/email_text_field.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/password_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: const SignUpPageBody(),
    );
  }
}

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  late SignUpCubit signUpCubit;
  final usernameTextController = TextEditingController();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;

  @override
  void initState() {
    super.initState();
    signUpCubit = BlocProvider.of(context);
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) =>
            previous.signUpStatus != current.signUpStatus,
        listener: (context, state) {
          if (state.signUpStatus == LoadStatus.success && state.checkStatus == LoadStatus.success) {
            signUpCubit.navAuth(context);
          }
          if(state.signUpStatus == LoadStatus.failure){
            return;
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AssetImage(AppImages.icLogoBlack)),
                const Spacer(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBold(text: 'Sign Up', textSize: 18,color: 0xff000000,),
                      SizedBox(height: 10),
                      TextNormal(text: 'Create an new account', textSize: 16,),
                    ],
                  ),
                ),
                const Spacer(),
                TextField(
                  controller: usernameTextController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                    ),
                    // suffixIcon: Image.asset(AppImages.icCheck, height: 1, width: 1),
                  ),
                ),
                const SizedBox(height: 10),
                EmailTextField(
                  textEditingController: emailTextController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                PasswordTextField(
                  textEditingController: passwordTextController,
                  labelText: 'Password',
                ),
                const SizedBox(height: 10),
                PasswordTextField(
                  textEditingController: confirmPasswordTextController,
                  labelText: 'Confirm Password',
                ),
                const Spacer(),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: state.isChecked,
                          onChanged: (value) {
                            signUpCubit.isUserChecked(value!);
                          },
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: SizedBox(
                            child: TextNormal(
                              text:
                              'By creating an account you have to agree with our them & condication',
                              textSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    signUpCubit.signUp(
                      context,
                      usernameTextController.text,
                      emailTextController.text,
                      passwordTextController.text,
                      confirmPasswordTextController.text,
                    );
                  },
                  child: const Button(
                    textButton: 'Sign Up',
                    colorButton: 0xFF000000,
                    colorText: 0xffffffff,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
