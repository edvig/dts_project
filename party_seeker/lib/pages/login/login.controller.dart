import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/login/login.view.dart';

class LoginController {
  final LoginView _view;
  GlobalController globalController = GlobalController();

  LoginController(this._view);

  int _counter = 0;

  void increment() {
    _counter++;
    _view.increment(_counter);
  }

  void login(String email, String password) async {
    _view.setLoading(true);

    //validate
    await Future.delayed(const Duration(seconds: 2));
    //RETURNED TRUE OR FALSE

    _view.setLoading(false);
    //if true
    _view.navigateTo(Routes.events);
  }
}
