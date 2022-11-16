extension MyDateTimeExtension on DateTime {
  String toSimpleDateString() {
    return "$day/$month/$year";
  }

  String toFormatedHour() {
    return "$hour:$minute";
  }
}
