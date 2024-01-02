import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/actions_body.dart';
import 'package:nuforce/app/modules/home/components/home_mini_tabs.dart';
import 'package:nuforce/app/modules/home/components/invoice_body.dart';
import 'package:nuforce/app/modules/home/components/performance_body.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/home/components/today_body.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (hcontroller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
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
                        children: [
                          ServiceButton(
                            svgPath: Assets.images.svg.customerService,
                            title: 'Service Center',
                            onTap: () {},
                          ),
                          ServiceButton(
                            svgPath: Assets.images.svg.businessManager,
                            title: 'Business Manager',
                            onTap: () {
                              Get.toNamed<void>(Routes.BUSINESS_MANAGER);
                            },
                          ),
                          ServiceButton(
                            svgPath: Assets.images.svg.serviceManager,
                            title: 'Service Manager',
                            onTap: () {
                              Get.toNamed<void>(Routes.SERVICE_ITEMS);
                            },
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
                  const HomeMiniTabs(),
                  const SizedBox(height: 16),
                  switch (hcontroller.miniTabEnum) {
                    MiniTabIndexEnum.today => const TodayBody(),
                    MiniTabIndexEnum.actions => const ActionsBody(),
                    MiniTabIndexEnum.performance => const PerformanceBody(),
                    MiniTabIndexEnum.invoices => const InvoiceBody(),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
