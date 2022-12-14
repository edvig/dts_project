import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/models/result.dart';
import 'package:party_seeker/models/user.dart';

import '../httpRequest/user.api.dart';

class UserUsecase {
  late UserApi _userApi;

  UserUsecase() {
    _userApi = UserApi();
  }

  // Future<Result<User>> createUser(User user) async {
  //   try {
  //     var userCreated = await _userApi.createUser(user);
  //     var globalController = GlobalController();
  //     globalController.user = userCreated;
  //     return Result(data: userCreated, isSuccess: true);
  //   } catch (ex) {
  //     return (Result(data: null, isSuccess: false));
  //   }
  // }

  // Future<Result<User>> logion(String username, String password) async {
  //   try {
  //     var userCreated = await _userApi.login(username, password);
  //     var globalController = GlobalController();
  //     globalController.user = userCreated;
  //     return Result(data: userCreated, isSuccess: true);
  //   } catch (ex) {
  //     return (Result(data: null, isSuccess: false));
  //   }
  // }
}
