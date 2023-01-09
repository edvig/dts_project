import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/usecases/events_usecase.dart';
import 'package:party_seeker/value_notifier_models/event_list.dart';

import '../../config/global.controller.dart';
import '../../config/routes.dart';
import '../../models/user.dart';
import 'profile.view.dart';

class ProfileController {
  final ProfileView _view;
  final GlobalController _globalController = GlobalController();
  final EventsUseCase _eventsUseCase = EventsUseCase();

  User get user => _globalController.user;
  EventList get eventListener => GlobalController().eventListener;

  ProfileController(this._view) {
    _setUserEvents(eventListener.value);
    GlobalController().addListenerToUpdateEvents(_setUserEvents);
  }

  void _setUserEvents(List<Event> events) {
    var filteredEvents = eventListener.value
        .where((element) => element.organizerId == user.id)
        .toList();
    _view.setUserEventList(filteredEvents);
  }

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
