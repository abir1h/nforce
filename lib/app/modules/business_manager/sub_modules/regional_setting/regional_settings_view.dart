import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/regional_settings_controller.dart';
import 'package:nuforce/gen/assets.gen.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../utils/colors.dart';
import 'widget/custom_button.dart';
import 'widget/custom_text_block.dart';
import '../../views/business_manager_preferences_view.dart';
import 'add_regional_settings.dart';

class RegionalSettings extends StatefulWidget {
  const RegionalSettings({super.key});

  @override
  State<RegionalSettings> createState() => _RegionalSettingsState();
}

class _RegionalSettingsState extends State<RegionalSettings> {
  final controller = Get.find<RegionalSettingController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => const BusinessManagerPreferences());
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white1,
        appBar: const CustomAppbarMinimal(
          title: 'Regional Settings',
        ),
        body: GetBuilder<RegionalSettingController>(builder: (_) {
          return controller.regionalSetting != null
              ? SizedBox(
                  height: 1.sh,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 16.w, top: 16.h, bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextBlock(
                                label: "Country",
                                value: controller.regionalSetting!.country,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: "Time zone",
                                value: controller.regionalSetting!.timeZone,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: "Date format",
                                value: controller.regionalSetting!.dateFormat,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: "Time format",
                                value: controller.regionalSetting!.timeFormat,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: "First Day of the Week",
                                value: controller.regionalSetting!.firstDayOfWeek,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: "Delete",
                                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.red),
                                borderColor: AppColors.red,
                                primaryColored: false,
                                onPressed: () {
                                  controller.delete();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: CustomButton(
                                text: "Edit",
                                primaryColored: true,
                                onPressed: () {
                                  Get.to(const AddRegionalSettings());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44.w),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            Assets.images.svg.empty,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Empty Data",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: AppColors.nutralBlack2, fontFamily: "Poppins"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
                      child: PrimaryButton(
                          onPressed: () {
                            Get.to(const AddRegionalSettings());
                          },
                          text: "Add Regional Settings",
                          primaryColored: true),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
