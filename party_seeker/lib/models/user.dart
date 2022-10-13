class User {
  String? name;
  int? age;
  String? token;

  User.fromJson(Map userJson) {
    name = userJson["name"];
    age = userJson["age"];
    token = userJson["token"];
  }

  Map toJson() {
    return {"name": name, "age": age, "token": token};
  }
}
