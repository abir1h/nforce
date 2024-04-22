import 'package:intl/intl.dart';

class DatetimeCustomFunc {
  static String getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat.yMMMd().format(dateTime);
  }

  static String dateWithTime(DateTime dateTime) {
    return DateFormat.yMMMd().add_jm().format(dateTime);
    // return DateFormat.yMMMd().format(dateTime);
  }

  static String getDashedDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String getFormattedDateWithMonth(DateTime dateTime) {
    return DateFormat('d MMM, yyyy').format(dateTime);
  }
}
