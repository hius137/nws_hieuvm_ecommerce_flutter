import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/splash/splash_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/splash/splash_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/splash/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          final appCubit = context.read<AppCubit>();
          final navigator = SplashNavigator(context: context);
          return SplashCubit(
            appCubit: appCubit,
            navigator: navigator,
          );
        },
        child: const SplashPageBody());
  }
}

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
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

  @override
  void dispose() {
    splashCubit.close();
    super.dispose();
  }
}
