import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessManagerCalendarController extends GetxController {
  final List<MockCalendar> _mockCalendar = [];

  List<MockCalendar> get mockCalendar => _mockCalendar;

  void addCalendar(MockCalendar mockCalendar) {
    _mockCalendar.add(mockCalendar);
    update();
  }

  void updateCalendar(MockCalendar mockCalendar) {
    final index = _mockCalendar.indexWhere((element) => element.id == mockCalendar.id);
    _mockCalendar[index] = mockCalendar;
    update();
  }

  void removeCalendar(MockCalendar mockCalendar) {
    _mockCalendar.remove(mockCalendar);
    update();
  }
}

class MockCalendar extends Equatable {
  final String id;
  final String name;
  final String? timeZone;
  final Color? color;
  final String? description;

  const MockCalendar({
    required this.id,
    required this.name,
    this.timeZone,
    this.color,
    this.description,
  });

  @override
  List<Object?> get props => [id, name, timeZone, color, description];
}
