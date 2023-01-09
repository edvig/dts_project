import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/secure_storage.dart';
import 'package:party_seeker/shared_prefs/shared_prefs.dart';

class GlobalController {
  late User _user;
  final SecureStorage _secureStorage = SecureStorage();
  final SharedPref _sharedPref = SharedPref();

  final List<Event> _events = List.empty(growable: true);
  bool get eventListIsEmpty => _events.isEmpty;

  List<Event> get events => _events;

  set events(List<Event> newValues) {
    for (var newEvent in newValues) {
      var valueToAdd = _events.firstWhere((event) => event.id == newEvent.id,
          orElse: () => Event.empty());

      if (valueToAdd.isEmptyEvent) {
        _events.add(newEvent);
      }
    }
  }

  void removeFromCachedEvents(int eventId) =>
      _events.removeWhere((event) => event.id == eventId);

  List<Event> get userEvents =>
      (_events.where((element) => element.organizerId == user.id)).toList();

  static final GlobalController _instance = GlobalController._internal();
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
    await _secureStorage.deleteAll();
    await _sharedPref.deleteAll();
  }
}
