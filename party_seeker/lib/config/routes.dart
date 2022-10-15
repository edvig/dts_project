import 'package:flutter/cupertino.dart';
import 'package:party_seeker/pages/addEvent/addEvent.page.dart';
import 'package:party_seeker/pages/events/events.page.dart';
import 'package:party_seeker/pages/login/login.page.dart';

import '../pages/sign_up/sign_up.page.dart';

class Routes {
  static const String login = "/";
  static const String events = "/events";
  static const String sign_up = "/sign_up";
  static const String addEvent = "/addEvent";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return _customNavigate(const LoginPage(), settings.name ?? login);

      case sign_up:
        return _customNavigate(const SignUpPage(), settings.name ?? login);

      case addEvent:
        return _customNavigate(const AddEventPage(), settings.name ?? login);

      case events:
        return _customNavigate(const EventsPage(), settings.name ?? login);

      default:
        return _customNavigate(const LoginPage(), login);
    }
  }

  static dynamic _customNavigate(Widget page, String name) {
    return CupertinoPageRoute(
        builder: (context) => page, settings: RouteSettings(name: name));
  }
}
