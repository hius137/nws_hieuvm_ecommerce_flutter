import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/auth_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/auth/auth_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(navigator: AuthNavigator(context: context)),
      child: const AuthPageBody(),
    );
  }
}

class AuthPageBody extends StatefulWidget {
  const AuthPageBody({super.key});

  @override
  State<AuthPageBody> createState() =>
      _AuthPageBodyState();
}

class _AuthPageBodyState extends State<AuthPageBody> {
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyPage(context),
    );
  }

  Widget _buildBodyPage(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: const Image(
            image: AssetImage(AppImages.imgStartLogin),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
        ),
        const Center(
          child: Image(
            image: AssetImage(AppImages.icLogoWhite),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      authCubit.navigator.navSignIn();
                    },
                    child: const Button(
                      textButton: 'Sign In',
                      colorButton: 0xFFFFFFFF,
                      colorText: 0xff000000,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      authCubit.navigator.navSignUp();
                    },
                    child: const BorderButton(textButton: 'Sign up'),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    authCubit.close();
    super.dispose();
  }
}


