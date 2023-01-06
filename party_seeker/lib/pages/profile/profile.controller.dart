import 'package:party_seeker/models/event.dart';

import '../../config/global.controller.dart';
import '../../config/routes.dart';
import '../../models/user.dart';
import 'profile.view.dart';

class ProfileController {
  final ProfileView _view;
  final GlobalController _globalController = GlobalController();

  User get user => _globalController.user;
  List<Event> get userEvents => _globalController.userEvents;
  int get userEventsLength => _globalController.userEvents.length;

  ProfileController(this._view);

  void logout() {
    _globalController.logout().then((value) {
      _view.navigateTo(Routes.login, removeUntil: true);
    });
  }
}
