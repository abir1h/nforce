import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

class TodayController extends GetxController {}

final List<MockEvents> mockEvents = [
  MockEvents(
    id: 1,
    title: "Event 1",
    date: DateTime(2024, 2, 1),
  ),
  MockEvents(
    id: 2,
    title: "Event 2",
    date: DateTime(2024, 2, 3),
  ),
  MockEvents(
    id: 3,
    title: "Event 3",
    date: DateTime(2024, 2, 5),
  ),
  MockEvents(
    id: 4,
    title: "Event 4",
    date: DateTime(2024, 2, 7),
  ),
  MockEvents(
    id: 5,
    title: "Event 5",
    date: DateTime(2024, 2, 9),
  ),
  MockEvents(
    id: 6,
    title: "Event 6",
    date: DateTime(2024, 2, 11),
  ),
  MockEvents(
    id: 7,
    title: "Event 7",
    date: DateTime(2024, 2, 13),
  ),
  MockEvents(
    id: 8,
    title: "Event 8",
    date: DateTime(2024, 2, 15),
  ),
  MockEvents(
    id: 9,
    title: "Event 9",
    date: DateTime(2024, 2, 17),
  ),
  MockEvents(
    id: 10,
    title: "Event 10",
    date: DateTime(2024, 2, 19),
  ),
];

class MockEvents {
  final int id;
  final String title;
  final DateTime date;
  final List<EventChild> eventChild = [
    EventChild(
      id: 1,
      title: "Alex",
      status: 'Completed',
      color: AppColors.green3,
      error: false,
      time: const TimeOfDay(hour: 12, minute: 0),
      isCompleted: true,
    ),
    EventChild(
      id: 2,
      title: "Rudigar",
      time: const TimeOfDay(hour: 13, minute: 0),
      color: AppColors.red,
      status: 'Missed',
      error: true,
      isCompleted: true,
    ),
    EventChild(
      id: 3,
      title: "Brahim Diaz",
      time: const TimeOfDay(hour: 14, minute: 0),
      color: AppColors.yellow,
      error: false,
      status: '15 min late',
      isCompleted: false,
    ),
    EventChild(
      id: 4,
      title: "Alaba",
      time: const TimeOfDay(hour: 15, minute: 0),
      color: AppColors.purple,
      error: false,
      status: '10 min early',
      isCompleted: false,
    ),
    EventChild(
      id: 5,
      title: "Bellingham",
      time: const TimeOfDay(hour: 16, minute: 0),
      color: AppColors.blue,
      error: false,
      status: 'On going',
      isCompleted: false,
    ),
    EventChild(
      id: 6,
      title: "Bellingham",
      time: const TimeOfDay(hour: 17, minute: 0),
      color: AppColors.white3,
      error: false,
      status: 'Open',
      isCompleted: false,
    ),
  ];

  MockEvents({
    required this.id,
    required this.title,
    required this.date,
  });
}

class EventChild {
  final int id;
  final String title;
  final String status;
  final TimeOfDay time;
  final Color color;
  final bool error;
  final bool isCompleted;

  EventChild({
    required this.id,
    required this.title,
    required this.status,
    required this.time,
    required this.color,
    required this.error,
    required this.isCompleted,
  });
}
