import 'package:flutter/foundation.dart' show protected;
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefHandler {
  SharedPreferences? _prefs;

  Future<SharedPreferences> init() async {
    if (_prefs != null) return _prefs!;

    return _prefs ??= await SharedPreferences.getInstance();
  }

  @protected
  Future<bool> deleteData() async => await _prefs!.clear();

  @protected
  void saveString(String key, String? value) =>
      value == null ? _prefs?.remove(key) : _prefs?.setString(key, value);

  @protected
  void saveInt(String key, int? value) =>
      value == null ? _prefs?.remove(key) : _prefs?.setInt(key, value);

  @protected
  void saveDouble(String key, double? value) =>
      value == null ? _prefs?.remove(key) : _prefs?.setDouble(key, value);

  @protected
  void saveBool(String key, bool? value) =>
      value == null ? _prefs?.remove(key) : _prefs?.setBool(key, value);

  @protected
  String? getString(String key) => _prefs?.getString(key);

  @protected
  int? getInt(String key) => _prefs?.getInt(key);

  @protected
  double? getDouble(String key) => _prefs?.getDouble(key);

  @protected
  bool? getBool(String key) => _prefs?.getBool(key);
}
