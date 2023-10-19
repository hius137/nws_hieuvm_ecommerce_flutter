import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/cart/cart_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/main/main_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/notification/notification_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: const MainScreenBody(),
    );
  }
}

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  late MainCubit mainCubit;

  @override
  void initState() {
    super.initState();
    mainCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return PageView(
            controller: mainCubit.pageController,
            onPageChanged: (index) {
              mainCubit.switchTap(index);
            },
            children: const [
              HomeScreen(),
              CartScreen(),
              NotificationScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) {
          return previous.curlIndex != current.curlIndex;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ]),
            child: GNav(
              onTabChange: (index) {
                mainCubit.switchTap(index);
              },
              selectedIndex: state.curlIndex,
              backgroundColor: Colors.white,
              color: Colors.white,
              activeColor: const Color(0xff000000),
              tabBackgroundColor: const Color(0xffeeeeee),
              gap: 8,
              padding: const EdgeInsets.all(10),
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  iconColor: Colors.black,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_cart_rounded,
                  iconColor: Colors.black,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.notifications,
                  iconColor: Colors.black,
                  text: 'Notification',
                ),
                GButton(
                  icon: Icons.account_circle,
                  iconColor: Colors.black,
                  text: 'User',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

