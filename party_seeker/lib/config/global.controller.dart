import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/secure_storage.dart';
import 'package:party_seeker/shared_prefs/shared_prefs.dart';

class GlobalController {
  late User _user;
  final SecureStorage _secureStorage = SecureStorage();
  final SharedPref _sharedPref = SharedPref();

  static final GlobalController _instance = GlobalController._internal();
  factory GlobalController() {
    return _instance;
  }

  GlobalController._internal();

  User get user => _user;
  set user(User value) {
    _user = value;
    if (value != null) {
      _sharedPref.user = value;
    }
  }

  Future<void> logout() async {
    await _secureStorage.deleteAll();
    await _sharedPref.deleteAll();
  }
}
