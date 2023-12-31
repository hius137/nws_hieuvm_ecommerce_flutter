import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  BuildContext context;

  AppNavigator({required this.context});

  Future<void> showSimpleDialog({
    String title = "Alert",
    String message = "",
    String? textConfirm = "Yes",
    String? textCancel = "No",
    barrierDismissible = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            textCancel != null
                ? TextButton(
                    child: Text(textCancel),
                    onPressed: () {
                    },
                  )
                : const SizedBox(),
            textConfirm != null
                ? TextButton(
                    child: Text(textConfirm),
                    onPressed: () {

                      onConfirm?.call();
                    },
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  void showErrorFlushBar({required String message}) {
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

  void showSuccessFlushBar({required String message}) {
    Flushbar(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
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
