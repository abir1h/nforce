import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/today_controller.dart';

class TodayView extends GetView<TodayController> {
  const TodayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodayView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TodayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
