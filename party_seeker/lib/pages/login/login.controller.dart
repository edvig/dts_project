import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/login/login.view.dart';
import 'package:party_seeker/usecases/user.usecase.dart';

class LoginController {
  final LoginView _view;
  final UserUsecase _userUsecase = UserUsecase();
  GlobalController globalController = GlobalController();

  LoginController(this._view);

  void login(String username, String password) async {
    _view.setLoading(true);

    var result = await _userUsecase.login(username, password);

    if (result.data ?? false) {
      _view.navigateTo(Routes.events);
    } else {
      _view.showErrorMessage("Error to make login, try again");
    }
    _view.setLoading(false);
  }
}
