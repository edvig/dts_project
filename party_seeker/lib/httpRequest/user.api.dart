import 'package:flutter/foundation.dart';
import 'package:party_seeker/models/user.dart';

import 'implementation/dio_impl.dart';

class UserApi {
  final DioImpl httpRequest = DioImpl();
  final String baseUrl = "http://localhost:8080";

  Future<User> createUser(User user) async {
    try {
      var response = await httpRequest.post(baseUrl, body: user.toJson());
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw "Error to create user";
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
      throw "Error to create user";
    }
  }

  //TODO this endpoint needs to be changed, because its necessary to return all user
  //information, but at moment returns only jwt token
  Future<String> loginUser(String username, String password) async {
    try {
      var url = "$baseUrl/auth/signin";
      var response = await httpRequest
          .post(url, body: {"username": username, "password": password});

      if (response.statusCode == 200) {
        return response.data;
      }
      throw "Error to login, try again";
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
      throw "Error to login, try again";
    }
  }
}
