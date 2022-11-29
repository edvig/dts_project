import 'package:party_seeker/config/routes.dart';
import 'package:party_seeker/pages/addEvent/add_event.view.dart';

import '../../usecases/events_usecase.dart';

class AddEventController {
  final AddEventView _view;
  final EventsUseCase _useCase = EventsUseCase();

  AddEventController(this._view);

  Future<void> createNewEvent() async {
    _view.setLoading(true);
    if (_view.isFormValid()) {
      var event = _view.getNewEvent();
      var result = await _useCase.createEvent(event);
      if (result.isSuccess) {
        _view.navigateTo(Routes.events);
      } else {
        _view.showErrorMessage(
            "There is a problem to create your event. Try again");
      }
    }
    _view.setLoading(false);
  }
}
