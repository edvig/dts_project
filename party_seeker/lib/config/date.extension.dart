extension MyDateTimeExtension on DateTime {
  String toSimpleDateString() {
    return "$day/$month/$year";
  }

  String toFormatedHour() {
    return "${hour}h:${minute}m";
  }

  String toSimpleDateAndHour() {
    var date = toSimpleDateString();
    var hour = toFormatedHour();
    return "$date $hour";
  }
}
