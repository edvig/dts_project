import 'package:mobx/mobx.dart';
part 'login.controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  int counter = 1;

  @action
  void increment() {
    counter++;
  }

  Future<bool> login(String email, String password) async {
    //access login usecase(email, password)
    await Future.delayed(const Duration(seconds: 2));

    return true;
  }
}
