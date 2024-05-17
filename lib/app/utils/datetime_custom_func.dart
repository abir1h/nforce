import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeCustomFunc {
  static String getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat.yMMMd().format(dateTime); // Jul 20, 2021
  }

  static String dateWithTime(DateTime dateTime) {
    return DateFormat.yMMMd().add_jm().format(dateTime); // Jul 20, 2021 3:00 PM
  }

  static String getDashedDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime); // 2021-07-20
  }

  static String getFormattedDateWithMonth(DateTime dateTime) {
    return DateFormat('d MMM, yyyy').format(dateTime); // 20 Jul, 2021
  }

  static String getDayName(DateTime dateTime) { 
    return DateFormat('EEEE').format(dateTime); // Tuesday
  }

  static String getFormattedTime(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
  }
}
