import 'package:party_seeker/models/user.dart';

import 'implementation/dio_impl.dart';

class UserApi {
  final DioImpl httpRequest = DioImpl();
  final String baseUrl = "https://localhost:8080/users";

  Future<User> createUser(User user) async {
    try {
      var response = await httpRequest.post(baseUrl, body: user.toJson());
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw "Error to create user";
      }
    } catch (ex) {
      print(ex);
      throw "Error to create user";
    }
  }
}
