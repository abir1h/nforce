import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

import '../controllers/business_customer_controller.dart';

class BusinessCustomerView extends GetView<BusinessCustomerController> {
  const BusinessCustomerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Customer',
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
