import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String bearerToken = "TOKEN";

  Future<void> saveToken(String token) async => _writeValue(bearerToken, token);
  Future<String?> getToken() async => _getValue(bearerToken);
  Future<void> deleteToken() async => _deleteValue(bearerToken);

  Future<void> _writeValue(String key, String value) async =>
      await storage.write(key: key, value: value);

  Future<String?> _getValue(String key) async => await storage.read(key: key);

  Future<void> _deleteValue(String key) async => await storage.delete(key: key);

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  // Future<Map<String, String>> _getAllValues() async => await storage.readAll();
}
