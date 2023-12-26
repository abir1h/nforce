import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import '../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../utils/colors.dart';
import '../../business_manager/controllers/custom_field_controller.dart';
import '../../business_manager/sub_modules/custom_field/customer_view.dart';
import '../../business_manager/sub_modules/custom_field/pre_order_field_view.dart';
import '../../business_manager/sub_modules/custom_field/project_view.dart';
import '../../business_manager/sub_modules/custom_field/service_view.dart';
import '../../../routes/app_pages.dart';
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

                  tabs: [
                    Tab(
                      text: 'Personal',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [PersonalInfoEdit(), Container()],
              ))
            ],
          ),
        ));
  }
}
