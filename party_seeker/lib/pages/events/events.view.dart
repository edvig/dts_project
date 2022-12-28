import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/base_view.dart';

abstract class EventsView implements BaseView {
  void setEvents(List<Event> events);
}
