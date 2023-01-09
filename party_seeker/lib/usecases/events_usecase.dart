import 'package:party_seeker/config/global.controller.dart';
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
      GlobalController().events = events;
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

  Future<Result<String>> updateEvent(Event event) async {
    try {
      var deleteResult = await deleteEvent(event.id!);
      if (deleteResult.hasError) {
        return Result(data: "Error to update this event!", isSuccess: false);
      }
      var createResult = await createEvent(event);
      if (createResult.isSuccess) {
        return Result(data: "Success", isSuccess: true);
      }
      return Result(data: "Error to update this event!", isSuccess: false);
    } catch (ex) {
      return Result(data: "Error to update event!", isSuccess: false);
    }
  }

  Future<Result<String>> deleteEvent(int eventId) async {
    try {
      var result = await _eventApi.deleteEventById(eventId);
      if (result) {
        GlobalController().removeFromCachedEvents(eventId);
        return Result(data: "Deleted with success", isSuccess: true);
      }
      return Result(data: "Error to deleted this event", isSuccess: false);
    } catch (ex) {
      return Result(data: "Error to deleted this event", isSuccess: false);
    }
  }
}
