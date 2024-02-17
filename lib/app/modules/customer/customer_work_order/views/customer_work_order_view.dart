import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_work_order_controller.dart';

class CustomerWorkOrderView extends GetView<CustomerWorkOrderController> {
  const CustomerWorkOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerWorkOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CustomerWorkOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
