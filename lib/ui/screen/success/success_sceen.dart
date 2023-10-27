import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/success/success_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuccessfulCubit>(
      create: (context) => SuccessfulCubit(),
      child: const AuthScreenBody(),
    );
  }
}

class AuthScreenBody extends StatefulWidget {
  const AuthScreenBody({super.key});

  @override
  State<AuthScreenBody> createState() => _AuthScreenBodyState();
}

class _AuthScreenBodyState extends State<AuthScreenBody> {
  late SuccessfulCubit successfulCubit;

  @override
  void initState() {
    super.initState();
    successfulCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    successfulCubit.navHome(context);
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
      ),
    );
  }
}
