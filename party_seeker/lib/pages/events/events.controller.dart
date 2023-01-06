import 'package:party_seeker/usecases/events_usecase.dart';

import 'events.view.dart';

class EventsController {
  final EventsView _view;
  final EventsUseCase _useCase = EventsUseCase();

  EventsController(this._view);

  Future<void> loadEvents() async {
    _view.setLoading(true);
    var eventsResult = await _useCase.getAllEvents();
    if (eventsResult.isSuccess) {
      _view.setEvents(eventsResult.data!);
    } else {
      _view.setErrorMessage("We have some problem to load events. Try again");
    }
    _view.setLoading(false);
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
