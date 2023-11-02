import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/success/success_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/success/success_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

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
          const TextBold(
            text: 'Successful!',
            textSize: 20,
            color: 0xff000000,
          ),
          const SizedBox(height: 10),
          Text(
            'You have successfully registered in our app and start working in it',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
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
                  colorButton: 0xff000000,
                  colorText: 0xffffffff,
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
