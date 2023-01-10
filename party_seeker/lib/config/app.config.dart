import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class AppConfig {
  static String get apiUrl {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return "http://10.0.2.2:8080";
      } else {
        return "http://Leonardos-MacBook-Pro.local:8080";
      }
    }
    //TODO change to production URL
    return "http://194.210.90.148:8080";
  }
}
