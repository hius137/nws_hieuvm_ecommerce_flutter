import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/cart_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/notification/notification_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_page.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(navigator: MainNavigator(context: context)),
      child: const MainPageBody(),
    );
  }
}

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  late MainCubit mainCubit;
  List<String> iconsBlack = [
    AppImages.icHome,
    AppImages.icCart,
    AppImages.icNotification,
    AppImages.icProfile
  ];
  List<String> iconsWhite = [
    AppImages.icHomeWhite,
    AppImages.icCartWhite,
    AppImages.icNotificationWhite,
    AppImages.icProfileWhite
  ];
  List<String> titles = ['Home', 'Cart', 'Notify', 'Profile'];

  @override
  void initState() {
    super.initState();
    mainCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mainCubit.onWillPop();
        return false;
      },
      child: Scaffold(
        body: _buildBodyPage(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  @override
  void dispose() {
    mainCubit.close();
    super.dispose();
  }

  Widget _buildBodyPage() {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) {
        return previous.curlIndex != current.curlIndex;
      },
      builder: (context, state) {
        return PageView(
          controller: mainCubit.pageController,
          onPageChanged: (value) {
            mainCubit.onIndexChange(value);
          },
          children: const [
            HomePage(),
            CartPage(),
            NotificationPage(),
            ProfilePage(),
          ],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) {
        return previous.curlIndex != current.curlIndex;
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => InkWell(
                  onTap: () => mainCubit.onPageChange(index),
                  child: _itemHomeBottom(
                    index,
                    state.curlIndex,
                    iconsBlack,
                    iconsWhite,
                    titles,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _itemHomeBottom(
    int index,
    int curIndex,
    List<String> iconsBlack,
    List<String> iconsWhite,
    List<String> titles,
  ) {
    return Container(
      child: index == curIndex
          ? AnimatedContainer(
              duration: const Duration(seconds: 5),
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffeeeeee),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: SvgPicture.asset(
                      iconsWhite[index],
                      width: 18,
                      height: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextBold(
                      text: titles[index],
                      textSize: 14,
                      color: 0xff000000,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                iconsBlack[index],
                width: 18,
                height: 18,
              ),
            ),
    );
  }
}
