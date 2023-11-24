import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/views/organization_view.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/business_manager_controller.dart';

class BusinessManagerView extends GetView<BusinessManagerController> {
  const BusinessManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Business Manager',
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceButton(
                    svgPath: Assets.images.svg.organization,
                    title: 'Organization',
                    onTap: () {
                      Get.to(() => const OrganizationView());
                    },
                  ),
                  ServiceButton(
                    svgPath: Assets.images.svg.customer,
                    title: 'Customer',
                    onTap: () {},
                  ),
                  ServiceButton(
                    svgPath: Assets.images.svg.accounts,
                    title: 'Accounts',
                    onTap: () {},
                  ),
                  ServiceButton(
                    svgPath: Assets.images.svg.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
