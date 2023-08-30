import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/home_mini_tabs.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/home/components/today_body.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.start,
                    children: [
                      ServiceButton(
                        svgPath: Assets.images.svg.customerService,
                        title: 'Service Center',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.businessManager,
                        title: 'Business Manager',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.serviceManager,
                        title: 'Service Manager',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.humanResource,
                        title: 'Human Resource',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.calendar,
                        title: 'Calendar',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.accounting,
                        title: 'Accounting',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.customer,
                        title: 'Customer',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              HomeMiniTabs(controller: controller),
              const SizedBox(height: 16),
              Obx(
                () => switch (controller.miniTabEnum.value) {
                  MiniTabIndexEnum.today => const TodayBody(),
                  MiniTabIndexEnum.actions => const Center(
                      child: Text('Actions'),
                    ),
                  MiniTabIndexEnum.performance => const Center(
                      child: Text('Performance'),
                    ),
                  MiniTabIndexEnum.invoices => const Center(
                      child: Text('Invoices'),
                    ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
