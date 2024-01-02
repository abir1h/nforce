import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/estimation_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class ChipTextField extends StatefulWidget {
  final bool readOnly;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool autoMaxLine;
  final VoidCallback? onTaped;

  const ChipTextField({
    required this.controller,
    super.key,
    this.readOnly = false,
    this.hintText,
    this.focusNode,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.autoMaxLine = false,
    this.onTaped,
  });

  @override
  State<ChipTextField> createState() => _ChipTextFieldState();
}

class _ChipTextFieldState extends State<ChipTextField> {
  final controller = Get.find<EstimationSettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimationSettingController>(
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.greyText),
            color: AppColors.textFieldBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Wrap(
              verticalDirection: VerticalDirection.down,
              children: List.generate(controller.commonPolices.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteCommonPolicySingle(index);
                    },
                    child: Container(

                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.primaryBlue3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(

                              onTap: () {
                                controller.deleteCommonPolicySingle(index);
                              },
                              child: Icon(
                                Icons.close,
                                size: 20.r,
                              ),),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            controller.commonPolices[index],overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: AppColors.nutralBlack2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),*/
              ListView.separated(
                separatorBuilder: (_, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemBuilder: (_, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColors.primaryBlue3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.deleteCommonPolicySingle(index);
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.r,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            controller.commonPolices[index],
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.commonPolices.length,
                shrinkWrap: true,
              ),
              TextFormField(
                controller: widget.controller,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                onFieldSubmitted: controller.setCommonPolicySingle,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Enter Common Policies',
                  hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
