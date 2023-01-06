import 'package:flutter/foundation.dart';
import 'package:party_seeker/config/app.config.dart';
import 'package:party_seeker/httpRequest/implementation/dio_impl.dart';
import 'package:party_seeker/models/event.dart';
import 'package:party_seeker/models/user.dart';
import 'package:party_seeker/shared_prefs/secure_storage.dart';

class EventApi {
  final DioImpl httpRequest = DioImpl();
  late String baseUrl;

  EventApi() {
    baseUrl = "${AppConfig.apiUrl}/events";
    var secureStorage = SecureStorage();
    secureStorage.getToken().then((token) {
      httpRequest.setHeader({"Authorization": "Bearer $token"});
    });
  }

  Future<List<Event>> getAllEvents() async {
    try {
      var result = await httpRequest.get(baseUrl);
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
      var result = await httpRequest.get(url);
      if (result.statusCode == 200) {
        return Event.fromJson(result.data);
      } else {
        throw "Error to load data";
      }
    } catch (err) {
      throw "Error to load event";
    }
  }

  Future<Event> createEvent(Event event) async {
    try {
      //TODO problems with date formant - toIsoString is returning error 400
      var result = await httpRequest.post(baseUrl, body: event.toJson());
      if (result.statusCode == 200) {
        return Event.fromJson(result.data);
      } else {
        throw "Error create this event";
      }
    } catch (ex) {
      throw "Error to create event";
    }
  }

  Future<List<User>> getParticipantsOfEvent(int eventId) async {
    try {
      var url = "$baseUrl/$eventId/participants";
      var result = await httpRequest.get(url);
      if (result.statusCode == 200) {
        var participants = List<User>.empty(growable: true);
        for (var userJson in (result.data as List)) {
          participants.add(User.fromJson(userJson));
        }
        return participants;
      } else {
        throw "Error to get participants list";
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw "Error to get participants list";
    }
  }

  Future<bool> attendToEvent(String eventId, String userId) async {
    try {
      var url = "$baseUrl/attend";
      var result = await httpRequest.post(url,
          body: {"eventId": eventId, "userId1": userId, "attend": false});
      if (result.statusCode == 200) {
        return true;
      } else {
        throw "Error to attend to this event";
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw "Error to attednd to this event";
    }
  }
}
