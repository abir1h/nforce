import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/views/business_manager_profile_view.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/user_roles_view.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Organization',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.profile,
                lable: 'Profile',
                onTap: () {
                  Get.to(() => const BusinessManagerProfileView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.userRoles,
                lable: 'User Roles',
                onTap: () {
                  Get.to(() => const UserRolesView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.simpleCalendar,
                lable: 'Calendar',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.labels,
                lable: 'Labels',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.contactGroups,
                lable: 'Contact Groups',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.commissions,
                lable: 'Commissions',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceCategory,
                lable: 'Service Category',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceTopic,
                lable: 'Service Topic',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceRegions,
                lable: 'Service Regions',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.termsAndPolicy,
                lable: 'Terms and Policy',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
