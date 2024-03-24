import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/addons/view/addons_view.dart';
import 'package:nuforce/app/modules/settings/sub_modules/addons/widgets/dotted_border.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../controller/addon_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';

class AddPluginViewScreen extends StatefulWidget {
  const AddPluginViewScreen({super.key});

  @override
  State<AddPluginViewScreen> createState() => _AddPluginViewScreenState();
}

class _AddPluginViewScreenState extends State<AddPluginViewScreen> {
  final controller = Get.put(AddonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () => Get.back(),
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Save',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppbarMinimal(
        title: 'Add New Expense',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Plugin Name',
              hint: 'Enter plugin name',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: 'Price',
              hint: r'$00.00',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: 'Details',
              hint: 'Write description...',
              maxLines: 4,
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.textFieldBackground,
                border: Border.all(color: AppColors.greyText),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: AppColors.textFieldBackground,
                      child: TextFormField(
                        controller: controller.featureController,
                        cursorColor: AppColors.primaryBlue1,
                        focusNode: controller.focusNode,
                        autocorrect: false,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          hintText: "Enter Features",
                          hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.featureController.text.isNotEmpty) {
                        controller
                            .addFeature(controller.featureController.text);
                        controller.focusNode.unfocus();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.white2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 21.w,
                          vertical: 11.h,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: AppColors.primaryBlue1,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Obx(
              () {
                if (controller.featureList.isNotEmpty) {
                  return Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.textFieldBackground,
                      border: Border.all(color: AppColors.greyText),
                    ),
                    child: Wrap(
                      children: List.generate(
                        controller.featureList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.white2,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.removeFeature(controller
                                        .featureList[index]
                                        .toString());
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.nutralBlack2,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  controller.featureList[index].toString(),
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.nutralBlack2,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                DottedRect(
                  color: Colors.grey,
                  gap: 5,
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
