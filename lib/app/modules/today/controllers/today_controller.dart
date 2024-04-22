import 'package:get/get.dart';

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

  MockEvents({
    required this.id,
    required this.title,
    required this.date,
  });
}
