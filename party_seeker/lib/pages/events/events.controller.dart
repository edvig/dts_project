import 'package:party_seeker/usecases/events_usecase.dart';

import 'events.view.dart';

class EventsController {
  EventsView _view;
  final EventsUseCase _useCase = EventsUseCase();

  EventsController(this._view);

  set view(EventsView value) => _view = value;

  Future<void> loadEvents() async {
    _view.setLoading(true);
    var eventsResult = await _useCase.getAllEvents();
    if (eventsResult.isSuccess) {
      _view.setEvents(eventsResult.data!);
    } else {
      _view.showErrorMessage("We have some problem to load events. Try again");
    }
    _view.setLoading(false);
  }
}
