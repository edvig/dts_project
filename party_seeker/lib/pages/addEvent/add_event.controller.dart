import 'package:party_seeker/pages/addEvent/add_event.view.dart';

import '../../usecases/events_usecase.dart';

class AddEventController {
  final AddEventView _view;
  final EventsUseCase _useCase = EventsUseCase();

  AddEventController(this._view);

  Future<void> createNewEvent() async {
    if (_view.isFormValid()) {
      var event = _view.getNewEvent();
      var result = _useCase.createEvent(event);
      //set error, loading, message, ....
    }
  }
}
