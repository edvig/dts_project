import 'package:party_seeker/config/global.controller.dart';
import 'package:party_seeker/httpRequest/event.api.dart';
import 'package:party_seeker/httpRequest/user.api.dart';
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

  Future<Result> attendToEvent(int eventId) async {
    try {
      var userId = GlobalController().user.id;
      var hasUserAlreadyAttend =
          await hasUserAlreadyAttendtoEvent(eventId, userId ?? 0);
      if (hasUserAlreadyAttend) {
        return Result(
            data: "You already attend to this event", isSuccess: false);
      }
      var result =
          await _eventApi.attendToEvent(eventId.toString(), userId.toString());
      return Result(data: result, isSuccess: result);
    } catch (ex) {
      return Result(
          data: "Error to attend to event, try again later.", isSuccess: false);
    }
  }

  Future<bool> hasUserAlreadyAttendtoEvent(int eventId, int userId) async {
    //TODO esse endpoint nao retornou nada
    var participants = await _eventApi.getParticipantsOfEvent(eventId);
    bool result = false;
    for (var participant in participants) {
      if (participant.id == userId) {
        result = true;
      }
    }

    return result;
  }
}
