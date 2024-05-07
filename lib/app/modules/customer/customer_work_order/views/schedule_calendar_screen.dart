import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class ScheduleCalendarScreen extends StatefulWidget {
  const ScheduleCalendarScreen({super.key});

  @override
  State<ScheduleCalendarScreen> createState() => _ScheduleCalendarScreenState();
}

class _ScheduleCalendarScreenState extends State<ScheduleCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:             TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        calendarStyle: CalendarStyle(outsideDaysVisible: false),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.
          return isSameDay(DateTime.now(), day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          /*showCupertinoModalPopup<void>(
            context: context,
            builder: (context) => const ViewScheduleBottomsheet(),
          );*/
        },
        onPageChanged: (focusedDay) {},
        calendarBuilders: CalendarBuilders(
          outsideBuilder: (context, date, events) {
            return Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          },
          selectedBuilder: (context, date, _) {
            return Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}
