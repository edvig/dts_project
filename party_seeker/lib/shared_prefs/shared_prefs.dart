import 'dart:convert';

import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/shared_prefs_handle.dart';

class SharedPref extends SharedPrefHandler {
  static const _userKey = "USER";

  static Future<SharedPref> initialize() async {
    var instance = SharedPref();
    await instance.init();
    return instance;
  }

  Future<bool> deleteAll() => deleteData();

  User? get user {
    var jsonString = getString(_userKey);
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
      saveString(_userKey, jsonString);
    }
  }
}
