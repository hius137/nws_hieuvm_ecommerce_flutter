import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/success/success_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/success/success_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuccessfulCubit>(
      create: (context) => SuccessfulCubit(navigator: SuccessNavigator(context: context)),
      child: const AuthPageBody(),
    );
  }
}

class AuthPageBody extends StatefulWidget {
  const AuthPageBody({super.key});

  @override
  State<AuthPageBody> createState() => _AuthPageBodyState();
}

class _AuthPageBodyState extends State<AuthPageBody> {
  late SuccessfulCubit successfulCubit;

  @override
  void initState() {
    super.initState();
    successfulCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyPage(),
    );
  }

  Widget _buildBodyPage() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AppImages.icCheckSuccess),
            width: 50,
            height: 50,
          ),
          Text(
            'Successful!',
            style: AppTextStyle.black18Bold,
          ),
          const SizedBox(height: 10),
          Text(
            'You have successfully registered in our app and start working in it',
            textAlign: TextAlign.center,
            style: AppTextStyle.black18W,
            ),
          const Spacer(),
          BlocBuilder<SuccessfulCubit, SuccessfulState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  successfulCubit.navigator.navHome();
                },
                child: const Button(
                  textButton: 'Start Shopping',
                  colorButton: AppColors.black,
                  colorText: AppColors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    successfulCubit.close();
    super.dispose();
  }
}
