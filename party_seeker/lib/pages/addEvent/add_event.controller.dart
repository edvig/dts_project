import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/pages/addEvent/add_event.view.dart';

class AddEventController {
  AddEventView _view;

  AddEventController(this._view);

  Future<void> createNewEvent() async {
    if (_view.isFormValid()) {
      var event = _view.getNewEvent();
      //send event to api
    }
  }
}
