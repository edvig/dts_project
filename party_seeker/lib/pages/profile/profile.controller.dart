import 'package:flutter/material.dart';

import '../../config/global.controller.dart';
import '../../config/routes.dart';
import 'profile.view.dart';

class ProfileController {
  final ProfileView _view;
  GlobalController globalController = GlobalController();

  ProfileController(this._view);

  void logout() {
    GlobalController().logout().then((value) {
      _view.navigateTo(Routes.login, removeUntil: true);
    });
  }
}
