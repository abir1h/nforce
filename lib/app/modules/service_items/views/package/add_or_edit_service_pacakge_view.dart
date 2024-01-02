import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class AddOrEditServicePacakgeView extends StatefulWidget {
  const AddOrEditServicePacakgeView({
    required this.isEdit,
    super.key,
  });
  final bool isEdit;

  @override
  State<AddOrEditServicePacakgeView> createState() => _AddOrEditServicePacakgeViewState();
}

class _AddOrEditServicePacakgeViewState extends State<AddOrEditServicePacakgeView> {
  String? categoryValue;
  String? defaultLabelValue;
  String? activityStatusValue;
  List<String> categoryItems = ['Category 1', 'Category 2', 'Category 3'];
  List<String> defaultLabelItems = ['Default Label 1', 'Default Label 2', 'Default Label 3'];
  List<String> activityStatusItems = ['Active', 'Inactive'];

  List<XFile?>? selectedImages = <XFile?>[];

  void addToSelectedImages(XFile image) {
    selectedImages!.add(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(title: widget.isEdit ? 'Edit Service Pacakge' : 'Add Service Pacakge'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickImage(ImageSource.gallery).then((value) {
                            setState(() {
                              if (value != null) addToSelectedImages(value);
                            });
                          });
                        },
                        child: SvgPicture.asset(Assets.images.svg.pickImage),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 64,
                          child: ListView.builder(
                            itemCount: selectedImages?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(
                                          File(selectedImages![index]!.path),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 3,
                                    right: 19,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedImages!.removeAt(index);
                                        });
                                      },
                                      child: SvgPicture.asset(Assets.images.svg.closeCircle),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: 'Service Name',
                    hint: 'Enter Service Pacakge Name',
                    controller: TextEditingController(text: 'Interior Scaping Experts'),
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    label: 'Category',
                    items: categoryItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Select Category',
                    onChanged: (v) {
                      setState(() {
                        categoryValue = v as String?;
                      });
                    },
                    value: categoryValue,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Service Code',
                    hint: 'Enter service code',
                    controller: null,
                  ),
                  Text(
                    'Leave empty to auto generate',
                    style: TextStyle(
                      color: AppColors.white4,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Cose',
                    hint: 'Enter Cost',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Minimum Partial Payment',
                    hint: 'Minimum Partial Payment',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Service Discount',
                    hint: 'Enter sevice discount',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    items: defaultLabelItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Default label',
                    label: 'Default label',
                    onChanged: (v) {
                      setState(() {
                        defaultLabelValue = v as String?;
                      });
                    },
                    value: defaultLabelValue,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Cancellation Fee',
                    hint: 'Cancellation Fee',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    items: activityStatusItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Available for order',
                    label: 'Active',
                    onChanged: (v) {
                      setState(() {
                        activityStatusValue = v as String?;
                      });
                    },
                    value: activityStatusValue,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Service Details',
                    hint: 'Write details...',
                    maxLines: 3,
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Terms and Policies',
                    hint: 'Enter terms and policies',
                    controller: null,
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButton(
                    text: widget.isEdit ? 'Update' : 'Save',
                    onPressed: () {},
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
