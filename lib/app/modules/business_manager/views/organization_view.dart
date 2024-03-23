import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_region/business_manager_service_region_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_topic/business_manager_service_topic_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_terms_and_policy_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/organization_roles/controllers/organization_role_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/organization_roles/organization_roles_view.dart';
import 'package:nuforce/app/modules/business_manager/views/organization_profile_view.dart';
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
                  Get.to<void>(() => const OrganizationProfileView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.userRoles,
                lable: 'User Roles',
                onTap: () {
                  late final OrganizationRoleController orgRoleController;
                  if (OrganizationRoleController().initialized) {
                    orgRoleController = Get.find<OrganizationRoleController>();
                    orgRoleController.getData();
                  } else {
                    orgRoleController = Get.put(OrganizationRoleController());
                    orgRoleController.getData();
                  }
                  Get.to<void>(() => const UserRolesView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.simpleCalendar,
                lable: 'Calendar',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerCalendarView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.labels,
                lable: 'Labels',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerLabelView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.contactGroups,
                lable: 'Contact Groups',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerContactGroupView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.commissions,
                lable: 'Commissions',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerCommissionTiersView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceCategory,
                lable: 'Service Category',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerServiceCatalogsView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceTopic,
                lable: 'Service Topic',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerServiceTopicView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.serviceRegions,
                lable: 'Service Regions',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerServiceRegionView());
                },
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.termsAndPolicy,
                lable: 'Terms and Policy',
                onTap: () {
                  Get.to<void>(() => const BusinessManagerTermsAndConditionView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
