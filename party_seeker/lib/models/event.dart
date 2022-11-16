class Event {
  String title;
  String local;
  String description;
  DateTime date;
  int minAge;
  double cost;

  String get formatedCost => "$cost€";

  Event(
      {required this.title,
      required this.local,
      required this.date,
      required this.minAge,
      required this.cost,
      required this.description});

  Event.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        local = json["local"],
        description = json["description"],
        date = DateTime.tryParse(json["date"]) ?? DateTime(1900),
        minAge = json["minAge"],
        cost = json["cost"];
}
