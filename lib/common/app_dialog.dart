import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppNavigator{
  BuildContext context;
  AppNavigator({required this.context});

  Future<bool> onWillPop() async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => buildExitDialog(),
    );
    return exitResult ?? false;
  }

  AlertDialog buildExitDialog() {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
      ],
    );
  }

  void showErrorFlushbar({required String message}) {
    Flushbar(
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error_outline,
        size: 28.0,
        color: Colors.white,
      ),
      titleColor: Colors.white,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black,
    ).show(context);
  }


  void showSuccessFlushbar({required String message}) {
    Flushbar(
      message: message,
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.check_circle_outline,
        size: 28.0,
        color: Colors.white,
      ),
      titleColor: Colors.white,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black,
    ).show(context);
  }

}





