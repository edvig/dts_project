import '../../config/global.controller.dart';
import '../../config/routes.dart';
import '../../models/user.dart';
import 'profile.view.dart';

class ProfileController {
  final ProfileView _view;
  final GlobalController _globalController = GlobalController();

  User get user => _globalController.user;

  ProfileController(this._view);

  void logout() {
    _globalController.logout().then((value) {
      _view.navigateTo(Routes.login, removeUntil: true);
    });
  }
}
