class Event {
  int? id;
  String title;
  String location;
  String description;
  DateTime date;
  int minAgeToAttend;
  double price;
  int? limitOfAttendants;
  double? timeOfStart;
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
      this.timeOfStart,
      this.id,
      required this.organizerId});

  Event.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        location = json["location"],
        description = json["description"],
        date = DateTime.tryParse(json["date"]) ?? DateTime(1900),
        minAgeToAttend = json["minAgeToAttend"],
        price = json["price"],
        organizerId = json["organizerId"],
        id = json["id"],
        limitOfAttendants = json["limitOfAttendants"],
        timeOfStart = json["timeOfStart"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "location": location,
        "description": description,
        "date": date.toIso8601String(),
        "minAgeToAttend": minAgeToAttend,
        "price": price,
        "limitOfAttendants": limitOfAttendants,
        "timeOfStart": timeOfStart,
        "organizerId": organizerId,
      };
}
