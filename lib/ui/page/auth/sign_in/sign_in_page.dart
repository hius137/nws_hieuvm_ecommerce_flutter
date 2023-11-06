import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/sign_in/sign_in_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';
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
                      const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Image(image: AssetImage(AppImages.icLogoBlack)),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome!',
                              style: AppTextStyle.black18Bold,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'please login or sign up to continue our app',
                              style: AppTextStyle.black16W,
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
                          colorButton: AppColors.black,
                          colorText: AppColors.white,
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
                          colorBorderButton: AppColors.white,
                          colorButton: AppColors.blue,
                          colorText: AppColors.white,),
                      const SizedBox(height: 10),
                      const IconBorderButton(
                          width: 350,
                          textButton: 'Continue with Google',
                          iconButton: AppImages.icGoogle,
                          colorBorderButton: AppColors.black,
                          colorButton: AppColors.white,
                          colorText: AppColors.black,),
                      const SizedBox(height: 10),
                      const IconBorderButton(
                          width: 350,
                          textButton: 'Continue with Apple',
                          iconButton: AppImages.icApple,
                          colorBorderButton: AppColors.black,
                          colorButton: AppColors.non,
                          colorText:AppColors.black),
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
