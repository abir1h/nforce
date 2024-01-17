import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/account_info/edit_business_info.dart';
import 'package:nuforce/app/modules/settings/sub_modules/account_info/edit_personal_info.dart';
import 'package:nuforce/app/modules/settings/sub_modules/branding/persona_edit.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import 'branding_edit.dart';

class BrandingEditView extends StatefulWidget {
  const BrandingEditView({super.key});

  @override
  State<BrandingEditView> createState() => _BrandingEditViewState();
}

class _BrandingEditViewState extends State<BrandingEditView> {
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Edit account information',
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              width: 1.sw,
              decoration: const BoxDecoration(color: AppColors.tabbarColor),
              child: TabBar(
                labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins'),
                indicatorColor: AppColors.nutralBlack1,
                unselectedLabelColor: AppColors.nutralBlack2,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins'),

                indicator: const BoxDecoration(
                  color: AppColors.primaryBlue1, // Set the overlay color for the selected tab
                ), // Set the indicator color here

                tabs: const [
                  Tab(
                    text: 'Persona',
                  ),
                  Tab(
                    text: 'Branding',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [PersonaEdit(), BrandingEdit()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
