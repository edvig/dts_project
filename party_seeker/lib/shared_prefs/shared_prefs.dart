import 'dart:convert';

import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/shared_prefs_handle.dart';

class SharedPref extends SharedPrefHandler {
  static Future<SharedPref> initialize() async {
    var instance = SharedPref();
    await instance.init();
    return instance;
  }

  User? get user {
    var jsonString = getString("user");
    if (jsonString is String) {
      var userJson = jsonDecode(jsonString);
      return User.fromJson(userJson);
    }
    return null;
  }

  set user(User? user) {
    if (user is User) {
      var userJson = user.toJson();
      var jsonString = jsonEncode(userJson);
      saveString("user", jsonString);
    }
  }
}
