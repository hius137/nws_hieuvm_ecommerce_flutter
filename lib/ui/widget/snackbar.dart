import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
  ));
}