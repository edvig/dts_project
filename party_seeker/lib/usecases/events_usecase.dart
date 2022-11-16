import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/result.dart';

class EventsUseCase {
  Future<Result<List<Event>>> getAllEvents() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      var event = Event(
          title: "My Event",
          local: "Bar",
          date: DateTime.now(),
          minAge: 18,
          cost: 1.5,
          description:
              "Create your team of 5 people and be ready to play a trivia game about history, geography, music and moreCreate your team of 5 people and be ready to play a trivia game about history, geography, music and more");
      return Result(data: [event, event, event, event], isSuccess: true);
    } catch (ex) {
      return (Result(data: [], isSuccess: false));
    }
  }
}
