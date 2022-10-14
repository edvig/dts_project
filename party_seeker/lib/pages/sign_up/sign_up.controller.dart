import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/sign_up/sign_up.view.dart';

class SignUpController {
  final SignUpView _view;
  GlobalController globalController = GlobalController();

  SignUpController(this._view);

  void login(String email, String password) async {
    _view.setLoading(true);

    //validate
    await Future.delayed(const Duration(seconds: 2));
    //RETURNED TRUE OR FALSE
    //if true
    _view.navigateTo(Routes.events);
    await Future.delayed(const Duration(seconds: 1));
    _view.setLoading(false);
  }
}
