import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/main/main_page.dart';

class CartNavigator extends AppNavigator{
  CartNavigator({required BuildContext context}) : super(context: context);

  void navMain()  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
        const MainPage(),
      ),
    );
  }
}