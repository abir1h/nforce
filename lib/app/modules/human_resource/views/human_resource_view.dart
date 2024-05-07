import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

import '../controllers/human_resource_controller.dart';

class HumanResourceView extends GetView<HumanResourceController> {
  const HumanResourceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Human Resource',
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
