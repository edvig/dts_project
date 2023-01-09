import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/usecases/events_usecase.dart';

import '../../config/global.controller.dart';
import '../../config/routes.dart';
import '../../models/user.dart';
import 'profile.view.dart';

class ProfileController {
  final ProfileView _view;
  final GlobalController _globalController = GlobalController();
  final EventsUseCase _eventsUseCase = EventsUseCase();

  User get user => _globalController.user;
  List<Event> get userEvents => _globalController.userEvents;
  int get userEventsLength => _globalController.userEvents.length;

  ProfileController(this._view);

  void logout() {
    _globalController.logout().then((value) {
      _view.navigateTo(Routes.login, removeUntil: true);
    });
  }

  Future<void> deleteEvent(int eventId) async {
    _view.setDeleteEventLoading(true);
    var result = await _eventsUseCase.deleteEvent(eventId);
    _view.showMessage(result.data ?? (result.isSuccess ? "Success" : "Error!"));
    _view.setDeleteEventLoading(false);
  }
}
