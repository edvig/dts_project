import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/usecases/events_usecase.dart';
import 'package:party_seeker/value_notifier_models/event_list.dart';

import 'events.view.dart';

class EventsController {
  final EventsView _view;
  final EventsUseCase _useCase = EventsUseCase();
  EventList get eventListener => GlobalController().eventListener;

  EventsController(this._view) {
    GlobalController()
        .addListenerToUpdateEvents((events) => _view.setEvents(events));
  }

  Future<void> loadEvents() async {
    _view.setLoading(true);
    if (GlobalController().eventListIsEmpty) {
      _updateEventListFromRepository();
    } else {
      _view.setEvents(GlobalController().events);
    }
    _view.setLoading(false);
  }

  Future<void> refreshEvents() async {
    _view.setLoading(true);
    await _updateEventListFromRepository();
    _view.setLoading(false);
  }

  Future<void> _updateEventListFromRepository() async {
    var eventsResult = await _useCase.getAllEvents();
    if (eventsResult.isSuccess) {
      _view.setEvents(eventsResult.data!);
    } else {
      _view.setErrorMessage("We have some problem to load events. Try again");
    }
  }

  Future<void> attendToEvent(int eventId) async {
    var result = await _useCase.attendToEvent(eventId);
    if (result.isSuccess) {
      _view.showMessage("Success");
    } else {
      _view.showErrorMessage(result.data.toString());
    }
  }
}
