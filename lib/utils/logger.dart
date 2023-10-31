import 'package:flutter/foundation.dart';

var logger = MyLogger();

class MyLogger {
  void v(dynamic message, {StackTrace? stackTrace}) {
    _print("🤍 VERBOSE: $message", stackTrace: stackTrace);
  }

  void d(dynamic message, {StackTrace? stackTrace}) {
    _print("💙 DEBUG: $message", stackTrace: stackTrace);
  }

  void e(dynamic message, {StackTrace? stackTrace}) {
    _print("❤️ ERROR: $message", stackTrace: stackTrace);
  }

  void _print(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      print("$message \n ${stackTrace ?? ''}");
    }
  }
}
