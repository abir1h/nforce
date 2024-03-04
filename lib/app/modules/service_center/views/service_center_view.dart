import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controllers/service_center_controller.dart';

class ServiceCenterView extends GetView<ServiceCenterController> {
  const ServiceCenterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Service Center',
      ),
      body: Center(
        child: Text(
          'ServiceCenterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
