import 'package:party_seeker/httpRequest/implementation/dio_impl.dart';
import 'package:party_seeker/models/event.dart';

class EventApi {
  final DioImpl http_request = DioImpl();
  final String baseUrl = "https://localhost:8080/events";

  Future<List<Event>> getAllEvents() async {
    try {
      var result = await http_request.get(baseUrl);
      List<Event> events = [];
      if (result.statusCode == 200) {
        var eventsJson = result.data;
        for (var eventJson in eventsJson) {
          events.add(Event.fromJson(eventJson));
        }
        return events;
      } else {
        throw "Error to load data";
      }
    } catch (err) {
      throw "Error to load list of events";
    }
  }

  Future<Event> getEventById(int id) async {
    try {
      var url = "$baseUrl/$id";
      var result = await http_request.get(url);
      if (result.statusCode == 200) {
        return Event.fromJson(result.data);
      } else {
        throw "Error to load data";
      }
    } catch (err) {
      throw "Error to load event";
    }
  }
}
