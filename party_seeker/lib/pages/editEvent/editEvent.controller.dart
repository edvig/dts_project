import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/pages/editEvent/editEvent.view.dart';
import 'package:party_seeker/usecases/events_usecase.dart';

class EditEventController {
  final EditEventView _view;
  final EventsUseCase _useCase = EventsUseCase();

  EditEventController(this._view);

  Future<void> saveEvent(Event event) async {
    _view.setLoading(true);
    var result = await _useCase.updateEvent(event);
    if (result.isSuccess) {
      _view.navigateBack();
    } else {
      _view.showErrorMessage(result.data ?? "Error to update");
    }
    _view.setLoading(false);
  }
}
