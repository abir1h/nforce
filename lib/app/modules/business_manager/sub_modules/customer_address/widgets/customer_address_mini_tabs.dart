import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_address/customer_address_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class CustomerAddressMinMiniTabs extends StatefulWidget {
  const CustomerAddressMinMiniTabs({super.key});

  @override
  State<CustomerAddressMinMiniTabs> createState() => _CustomerAddressMinMiniTabsState();
}

class _CustomerAddressMinMiniTabsState extends State<CustomerAddressMinMiniTabs> {
  @override
  void initState() {
    super.initState();
    if (!CustomerAddressController().initialized) {
      Get.put(CustomerAddressController());
    } else {
      Get.find<CustomerAddressController>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerAddressController>(
      builder: (controller) {
        return Container(
          color: AppColors.primaryBlue3,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.addresses,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.addresses);
                  },
                  text: 'Addresses',
                  isMini: true,
                  svgPath: Assets.images.svg.miniPinLocation,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.phones,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.phones);
                  },
                  text: 'Phone',
                  isMini: true,
                  svgPath: Assets.images.svg.miniPhone,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.emails,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.emails);
                  },
                  text: 'Email',
                  isMini: true,
                  svgPath: Assets.images.svg.miniEmail,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.events,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.events);
                  },
                  text: 'Events',
                  isMini: true,
                  svgPath: Assets.images.svg.miniEvents,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.notes,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.notes);
                  },
                  text: 'Notes',
                  isMini: true,
                  svgPath: Assets.images.svg.miniNotes,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.licenses,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.licenses);
                  },
                  text: 'Licenses',
                  isMini: true,
                  svgPath: Assets.images.svg.mniLicense,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == ContactDetailsTabEnum.serviceRegions,
                  onTap: () {
                    controller.updateTabEnum(ContactDetailsTabEnum.serviceRegions);
                  },
                  text: 'Service Regions',
                  isMini: true,
                  svgPath: Assets.images.svg.miniServiceRegion,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
