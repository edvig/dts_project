import 'package:party_seeker/config/date.extension.dart';

class Event {
  int? id;
  String title;
  String? location;
  String description;
  DateTime date;
  int minAgeToAttend;
  double price;
  int? limitOfAttendants;
  int organizerId;

  String get formatedCost => "$price";

  Event(
      {required this.title,
      required this.location,
      required this.date,
      required this.minAgeToAttend,
      required this.price,
      required this.description,
      this.limitOfAttendants,
      this.id,
      required this.organizerId});

  Event.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        location = json["location"],
        description = json["description"] ?? "",
        date = _parseDate(json["dateTime"]),
        minAgeToAttend = json["minAgeToAttend"] ?? 0,
        price = json["price"],
        organizerId = json["organizerId"],
        id = json["id"],
        limitOfAttendants = json["limitOfAttendants"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "location": location,
        "description": description,
        "minAgeToAttend": minAgeToAttend,
        "price": price,
        "limitOfAttendants": limitOfAttendants,
        "dateTime": date.toApiDate(),
        "organizerId": organizerId,
      };

  static DateTime _parseDate(String? date) {
    if (date == null) return DateTime(1900);
    var dateParsed = DateTime.tryParse(date);
    return dateParsed ?? DateTime(1900);
  }
}
