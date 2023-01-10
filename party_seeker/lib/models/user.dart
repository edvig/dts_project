import 'package:party_seeker/config/date.extension.dart';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? username;
  DateTime? birthday;
  String? password;

  User(
      {this.id,
      this.birthday,
      this.emailAddress,
      this.firstName,
      this.lastName,
      this.username,
      this.password});

  User.fromJson(Map userJson) {
    id = userJson["id"];
    firstName = userJson["firstName"];
    lastName = userJson["lastName"];
    emailAddress = userJson["emailAddress"];
    username = userJson["username"];
    birthday = DateTime.tryParse(userJson["birthday"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
      "password": password,
      "username": username,
      "birthday": birthday?.toApiDate()
    };
  }
}
