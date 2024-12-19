import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String ddMMyyyy = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = ddMMyyyy,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

extension TimeDeltaString on int {
  String toReadableTimeDelta({String pattern = 'h:m:s'}) {
    int totalSeconds = this ~/ 1000;
    int totalMinutes = totalSeconds ~/ 60;
    int totalHours = totalMinutes ~/ 60;

    int secondsFromMinute = totalSeconds % 60;
    int minutesFromHour = totalMinutes % 60;

    String formattedTime = pattern
        .replaceAll('h', totalHours.toString().padLeft(2, '0'))
        .replaceAll('m', minutesFromHour.toString().padLeft(2, '0'))
        .replaceAll('s', secondsFromMinute.toString().padLeft(2, '0'));

    return formattedTime;
  }
}
