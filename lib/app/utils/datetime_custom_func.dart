import 'package:intl/intl.dart';

class DatetimeCustomFunc {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }

  static String dateWithTime(DateTime dateTime) {
    return DateFormat.yMMMd().add_jm().format(dateTime);
    // return DateFormat.yMMMd().format(dateTime);
  }
}
