import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_orders_controller.dart';

class NewOrdersView extends GetView<NewOrdersController> {
  const NewOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewOrdersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewOrdersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
