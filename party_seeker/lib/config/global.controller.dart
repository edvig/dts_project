import 'package:party_seeker/models/user.dart';

class GlobalController {
  User? user;

  static final GlobalController _instance = GlobalController._internal();
  factory GlobalController() {
    return _instance;
  }

  GlobalController._internal();
}
