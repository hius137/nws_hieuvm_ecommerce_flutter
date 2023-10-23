import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/sign_in/sign_in_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/textfield/email_text_field.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/textfield/password_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(
        appCubit: RepositoryProvider.of<AppCubit>(context),
      ),
      child: const SignInScreenBody(),
    );
  }
}

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  late SignInCubit signInCubit;
  late TextEditingController emailTextController;
  late TextEditingController passwordController;
  // late FirebaseStoreHelper firebaseStoreHelper = FirebaseStoreHelper();

  @override
  void initState() {
    super.initState();
    signInCubit = BlocProvider.of(context);
    emailTextController = TextEditingController(text: 'admin@mail.com');
    passwordController = TextEditingController(text: 'admin123');
  }

  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async{ return shouldPop;},
        child: BlocConsumer<SignInCubit, SignInState>(
          listenWhen: (previous, current) {
            return previous.signInStatus != current.signInStatus;
          },
          listener: (context, state) {
            if (state.signInStatus == LoadStatus.success) {
              signInCubit.navAuth(context);
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  const Image(image: AssetImage(AppImages.icLogoBlack)),
                  const Spacer(),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(text: 'Welcome!', textSize: 20),
                        SizedBox(height: 10),
                        TextNormal(
                            text: 'please login or sign up to continue our app',
                            textSize: 18),
                      ],
                    ),
                  ),
                  const Spacer(),
                  EmailTextField(
                    textEditingController: emailTextController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  PasswordTextField(
                    textEditingController: passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      signInCubit.navSignUp(context);
                    },
                    child: const TextBold(
                      textSize: 18,
                      text: 'register now',
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      signInCubit.signIn(
                          emailTextController.text, passwordController.text);
                    },
                    child: const Button(
                      textButton: 'Login',
                      colorButton: 0xFF000000,
                      colorText: 0xffffffff,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('or'),
                  // 0xFF3b5999
                  const SizedBox(height: 10),
                  const IconBorderButton(
                      width: 350,
                      textButton: 'Continue with Facebook',
                      iconButton: AppImages.icFacebook,
                      colorBorderButton: 0,
                      colorButton: 0xFF3b5999,
                      colorText: 0xff000000),
                  const SizedBox(height: 10),
                  const IconBorderButton(
                      width: 350,
                      textButton: 'Continue with Google',
                      iconButton: AppImages.icGoogle,
                      colorBorderButton: 0xff000000,
                      colorButton: 0,
                      colorText: 0xff000000),
                  const SizedBox(height: 10),
                  const IconBorderButton(
                      width: 350,
                      textButton: 'Continue with Apple',
                      iconButton: AppImages.icApple,
                      colorBorderButton: 0xff000000,
                      colorButton: 0,
                      colorText: 0xff000000),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
