import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';

import '../../../../routes/app_pages.dart';
import 'edit_business_info.dart';
import 'edit_personal_info.dart';

class AccountInfoEditView extends StatefulWidget {
  const AccountInfoEditView({super.key});

  @override
  State<AccountInfoEditView> createState() => _AccountInfoEditViewState();
}

class _AccountInfoEditViewState extends State<AccountInfoEditView> {
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white1,
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppbarMinimal(
          title: 'Edit account informtaion',
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                width: 1.sw,
                decoration: const BoxDecoration(color: AppColors.tabbarColor),
                child: TabBar(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins"),
                  indicatorColor: AppColors.nutralBlack1,
                  unselectedLabelColor: AppColors.nutralBlack2,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins"),

                  indicator: const BoxDecoration(
                      color: AppColors
                          .primaryBlue1 // Set the overlay color for the selected tab
                      ), // Set the indicator color here

                  tabs: const [
                    Tab(
                      text: 'Personal',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [PersonalInfoEdit(), BusinessInfoEdit()],
              ))
            ],
          ),
        ));
  }
}
