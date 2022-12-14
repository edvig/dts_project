class User {
  int? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? username;
  DateTime? birthday;

  User.fromJson(Map userJson) {
    id = userJson["id"];
    firstName = userJson["firstName"];
    lastName = userJson["lastName"];
    emailAddress = userJson["emailAddress"];
    username = userJson["username"];
    birthday = DateTime.tryParse(userJson["birthday"]);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
