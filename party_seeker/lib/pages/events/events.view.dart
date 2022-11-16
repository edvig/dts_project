import 'package:party_seeker/models/event.dart';

abstract class EventsView {
  void navigateTo(String route);
  void setLoading(bool value);
  void setEvents(List<Event> events);
  void showErrorMessage(String message);
}
