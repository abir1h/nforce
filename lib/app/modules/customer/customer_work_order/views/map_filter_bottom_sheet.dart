import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/utils/colors.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/secondary_button.dart';
import '../../../../utils/text_styles.dart';
import '../controllers/customer_work_order_controller.dart';


class MapFilterBottomSheet extends StatefulWidget {
  const MapFilterBottomSheet({
    super.key,
  });

  @override
  State<MapFilterBottomSheet> createState() => _MapFilterBottomSheetState();
}

class _MapFilterBottomSheetState extends State<MapFilterBottomSheet> {
  final controller = Get.put(CustomerWorkOrderController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder<CustomerWorkOrderController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: mediaQuery.padding.top * 7),
              padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1),
                      ),
                      IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.clear,color: Colors.grey,))
                    ],
                  ),Divider(thickness: 1,),
                  Text(
                    "Service Region",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "poppins",
                        color: AppColors.nutralBlack1),
                  ), SizedBox(height: 16.h,),
                  CustomDropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: 'X',
                        child: Text(
                          'x',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Y',
                        child: Text(
                          'X',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Z',
                        child: Text(
                          'z',
                        ),
                      ),
                    ],
                    hint: 'Select one',
                    onChanged: (newVal) {},
                    value: null,
                  ),
                  SizedBox(height: 16.h), Text(
                    "Field Agents",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "poppins",
                        color: AppColors.nutralBlack1),
                  ), SizedBox(height: 16.h,),
                  CustomDropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: 'X',
                        child: Text(
                          'x',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Y',
                        child: Text(
                          'X',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Z',
                        child: Text(
                          'z',
                        ),
                      ),
                    ],
                    hint: 'Select one',
                    onChanged: (newVal) {},
                    value: null,
                  ),
                  SizedBox(height: 16.h),

                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'On Date',
                          style: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.nutralBlack1,
                            // fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.greyText),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'DD-MM-YYYY',
                                style: TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(Assets.images.svg.calendarMonth),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: ()=>Get.back(),
                          text: 'Reset',
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: ()=>Get.back(),

                          text: 'Save',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
