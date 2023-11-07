import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_dialog.dart';

class MainNavigator extends AppNavigator{
  MainNavigator({required BuildContext context}) : super(context: context);

  void closeDialog() {
    Navigator.of(context).pop(context);
  }

  void exit(){
    SystemNavigator.pop();
  }
}