import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_up/sign_up_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/snackbar.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/textfield/email_text_field.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/textfield/password_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: const SignUpScreenBody(),
    );
  }
}

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  late SignUpCubit signUpCubit;
  final usernameTextController = TextEditingController();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;

  @override
  void initState() {
    super.initState();
    signUpCubit = BlocProvider.of(context);
    emailTextController = TextEditingController(text: '');
    passwordTextController = TextEditingController(text: '');
    confirmPasswordTextController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                  TextBold(text: 'Sign Up', textSize: 18),
                  SizedBox(height: 10),
                  TextNormal(text: 'Create an new account', textSize: 16)
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
                    borderSide: BorderSide(color: Colors.black12, width: 1)),
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
                labelText: 'Password'),
            const SizedBox(height: 10),
            PasswordTextField(
                textEditingController: confirmPasswordTextController,
                labelText: 'Password'),
            const SizedBox(height: 30),
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
                    const SizedBox(
                        width: 300,
                        child: TextNormal(text: 'By creating an account you have to agree with our them & condication', textSize: 16)),
                  ],
                );
              },
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                signUpCubit.signUp(usernameTextController.text,
                    emailTextController.text, passwordTextController.text);
                signUpCubit.navAuth(context);
                showSnackBar(context, 'Sign up success!');
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
      ),
    );
  }
}
