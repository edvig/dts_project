class Event {
  String title;
  String local;
  String description;
  DateTime date;
  int minAge;
  double cost;

  String get formatedHour => "${date.hour}:${date.minute}";
  String get formatedDate => "${date.day}/${date.month}/${date.year}";
  String get formatedCost => "$cost€";

  Event(
      {required this.title,
      required this.local,
      required this.date,
      required this.minAge,
      required this.cost,
      required this.description});
}
