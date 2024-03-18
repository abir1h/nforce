import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calendar_controller.dart';

class ServiceCenterCalendarView extends GetView<ServiceCenterCalendarController> {
  const ServiceCenterCalendarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalendarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CalendarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
