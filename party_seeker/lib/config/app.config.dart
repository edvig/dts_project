import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class AppConfig {
  static String get apiUrl {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return "http://10.0.2.2:8080";
      } else {
        return "http://localhost:8080";
      }
    }
    //TODO change to production URL
    return "http://localhost:8080";
  }
}
