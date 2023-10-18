import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/splash/splash_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          final appCubit = context.read<AppCubit>();
          return SplashCubit(appCubit: appCubit);
        },
        child: const SplashScreenBody());
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  late SplashCubit splashCubit;

  @override
  void initState() {
    super.initState();
    splashCubit = BlocProvider.of<SplashCubit>(context);
    splashCubit.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
        return Image(
          image: const AssetImage(AppImages.imgSplash),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        );
      }),
    );
  }
}
