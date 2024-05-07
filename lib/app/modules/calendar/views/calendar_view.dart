import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Calendar',
      ),
      body: Center(
        child: Text(
          'In development',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
