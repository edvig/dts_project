import 'package:flutter/material.dart';
import 'package:party_seeker/models/event.dart';

class EventList extends ValueNotifier<List<Event>> {
  EventList() : super([]);

  void addEvents(List<Event> events) {
    for (var newEvent in events) {
      _checkAndAddEvent(newEvent);
    }
    notifyListeners();
  }

  void removeEvent(int eventId) {
    value.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }

  void addEvent(Event event) {
    _checkAndAddEvent(event);
    notifyListeners();
  }

  void _checkAndAddEvent(Event event) {
    var valueToAdd = value.firstWhere((item) => item.id == event.id,
        orElse: () => Event.empty());

    if (valueToAdd.isEmptyEvent) {
      value.add(event);
    }
  }

  void addListenerToUpdateList(void Function(List<Event> events) listener) {
    addListener(() => listener(value));
  }
}
