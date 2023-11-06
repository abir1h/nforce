import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/service_items/controllers/add_new_service_controller.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class NewAddonBody extends StatefulWidget {
  const NewAddonBody({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;

  @override
  State<NewAddonBody> createState() => _NewAddonBodyState();
}

class _NewAddonBodyState extends State<NewAddonBody> {
  final controller = Get.put(AddNewServiceController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image picker
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                await pickImage(ImageSource.gallery).then((value) {
                  if (value != null) controller.addToSelectedImages(value);
                });
              },
              child: SvgPicture.asset(Assets.images.svg.pickImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 64,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.selectedImages?.length ?? 0,
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
                                  File(controller.selectedImages![index]!.path),
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
                                controller.selectedImages!.removeAt(index);
                              },
                              child: SvgPicture.asset(Assets.images.svg.closeCircle),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Title',
          hint: 'Enter item name',
          controller: widget.titleController,
        ),
        const SizedBox(height: 16),
        Text(
          'Product Type',
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomDropdownButton(
          items: [
            DropdownMenuItem(
              value: 'producttypex',
              child: Text(
                'Product Type X',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'producttypey',
              child: Text(
                'Product Type Y',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          hint: 'Product Type',
          onChanged: (v) {},
          value: 'producttypex',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Price',
          hint: 'Enter const',
          controller: widget.priceController,
        ),
        const SizedBox(height: 8),
        Text(
          'One time fee',
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Type',
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomDropdownButton(
          items: [
            DropdownMenuItem(
              value: 'type1',
              child: Text(
                'Type 1',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'type2',
              child: Text(
                'Type 2',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          hint: 'Type',
          onChanged: (v) {},
          value: 'type1',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "What's included",
          hint: 'Write details...',
          controller: widget.descriptionController,
          maxLines: 3,
        ),
        const SizedBox(height: 24),
        PrimaryButton(onPressed: () {}, text: 'Save'),
        SizedBox(height: 8.sp),
      ],
    );
  }
}
