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

  String toApiDate() {
    String fixedYear = _fourDigits(year);
    String fixedMonth = _twoDigits(month);
    String fixedDay = _twoDigits(day);
    String fixedHour = _twoDigits(hour);
    String fixedMinute = _twoDigits(minute);
    String fixedSecond = _twoDigits(second);

    return "$fixedYear-$fixedMonth-$fixedDay $fixedHour:$fixedMinute";
  }

  String _fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
//date: 2023-01-06 12:07:47
//dateTime: "2023-01-10 15:19"