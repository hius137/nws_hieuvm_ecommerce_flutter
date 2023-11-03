import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/email_text_field.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text_field/password_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) {
        final navigator = SignInNavigator(context: context);
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return SignInCubit(
          navigator: navigator,
          appCubit: appCubit,
        );
      },
      child: const SignInPageBody(),
    );
  }
}

class SignInPageBody extends StatefulWidget {
  const SignInPageBody({super.key});

  @override
  State<SignInPageBody> createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    bool shouldPop = false;
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) {
          return previous.signInStatus != current.signInStatus;
        },
        builder: (context, state) {
          return state.signInStatus == LoadStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      const Image(image: AssetImage(AppImages.icLogoBlack)),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBold(
                              text: 'Welcome!',
                              textSize: 18,
                              color: 0xff000000,
                            ),
                            SizedBox(height: 5),
                            TextNormal(
                              text:
                                  'please login or sign up to continue our app',
                              textSize: 16,
                              color: 0x73000000,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      EmailTextField(
                        textEditingController: emailTextController,
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      PasswordTextField(
                        textEditingController: passwordController,
                        labelText: 'Password',
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          signInCubit.signIn(
                            context,
                            emailTextController.text,
                            passwordController.text,
                          );
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
                          colorText: 0xffffffff),
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
    );
  }

  @override
  void dispose() {
    signInCubit.close();
    super.dispose();
  }
}
