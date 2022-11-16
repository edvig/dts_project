import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/pages/addEvent/add_event.view.dart';

class AddEventController {
  AddEventView _view;

  AddEventController(this._view);

  Future<void> createNewEvent(String title, DateTime dateTime, double price,
      String description, String local, int minAge) async {
    var event = Event(
        title: title,
        local: local,
        date: dateTime,
        minAge: minAge,
        cost: price,
        description: description);
  }
}
