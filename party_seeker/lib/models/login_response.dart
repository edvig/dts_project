import 'package:party_seeker/models/user.dart';

class LoginResponse {
  User user;
  String token;

  LoginResponse.fromJson(Map json)
      : user = User.fromJson(json["user"]),
        token = json["token"];
}
