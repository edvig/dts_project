import 'package:party_seeker/httpRequest/event.api.dart';
import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/result.dart';

class EventsUseCase {
  late EventApi _eventApi;

  EventsUseCase() {
    _eventApi = EventApi();
  }

  Future<Result<List<Event>>> getAllEvents() async {
    try {
      var events = await _eventApi.getAllEvents();
      return Result(data: events, isSuccess: true);
    } catch (ex) {
      return (Result(data: [], isSuccess: false));
    }
  }

  Future<Result<Event>> getEvent(int eventId) async {
    try {
      var event = await _eventApi.getEventById(eventId);
      return Result(data: event, isSuccess: true);
    } catch (ex) {
      return Result(data: null, isSuccess: false);
    }
  }

  Future<Result<Event>> createEvent(Event event) async {
    try {
      var eventCreated = await _eventApi.createEvent(event);
      return Result(data: eventCreated, isSuccess: true);
    } catch (ex) {
      return Result(data: null, isSuccess: false);
    }
  }
}
