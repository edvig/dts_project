import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/sign_up/sign_up.view.dart';
import 'package:party_seeker/usecases/user.usecase.dart';

class SignUpController {
  final SignUpView _view;
  GlobalController globalController = GlobalController();
  UserUsecase _userUsecase = UserUsecase();

  SignUpController(this._view);

  void signup() async {
    _view.setLoading(true);
    if (_view.isFormValid()) {
      var user = _view.getUser();
      var result = await _userUsecase.createUser(user);
      if (result.hasError) {
        _view.showErrorMessage("Error to create user. Try again");
      } else {
        _userUsecase.login(user.username ?? "", user.password ?? "");
        _view.navigateTo(Routes.events);
      }
    }
    _view.setLoading(false);
  }
}
