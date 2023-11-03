import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/success/success_page.dart';

class SignInNavigator extends AppNavigator{
  SignInNavigator({required BuildContext context}) : super(context: context);

  void navSuccessPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SuccessPage(),
      ),
    );
  }
}