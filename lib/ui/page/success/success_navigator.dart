import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/main/main_page.dart';

class SuccessNavigator extends AppNavigator{
  SuccessNavigator({required BuildContext context}) : super(context: context);

  void navHome()  {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
        const MainPage(),
      ),
    );
  }
}