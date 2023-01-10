import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/secure_storage.dart';
import 'package:party_seeker/shared_prefs/shared_prefs.dart';
import 'package:party_seeker/value_notifier_models/event_list.dart';

class GlobalController {
  late User _user;
  final SecureStorage _secureStorage = SecureStorage();
  final SharedPref _sharedPref = SharedPref();
  final EventList _events = EventList();
  EventList get eventListener => _events;
  bool get eventListIsEmpty => _events.value.isEmpty;
  List<Event> get events => _events.value;

  static final GlobalController _instance = GlobalController._internal();

  void removeFromCachedEvents(int eventId) => _events.removeEvent(eventId);

  void addEvents(List<Event> newEvents) => _events.addEvents(newEvents);

  void addListenerToUpdateEvents(void Function(List<Event> events) listener) =>
      _events.addListenerToUpdateList(listener);

  factory GlobalController() {
    return _instance;
  }

  GlobalController._internal();

  User get user => _user;
  set user(User value) {
    _user = value;
    _sharedPref.user = value;
  }

  Future<void> logout() async {
    //TODO delete events
    await _secureStorage.deleteAll();
    await _sharedPref.deleteAll();
  }
}
