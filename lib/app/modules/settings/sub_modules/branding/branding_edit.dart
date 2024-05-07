import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/widgets/choose_button.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class BrandingEdit extends StatefulWidget {
  const BrandingEdit({super.key});

  @override
  State<BrandingEdit> createState() => _BrandingEditState();
}

class _BrandingEditState extends State<BrandingEdit> {
  TextEditingController colorCodeController = TextEditingController();
  ColorSwatch? _mainColor = Colors.blue;
  ColorSwatch? _tempMainColor;

  @override
  void initState() {
    super.initState();

    // Set the initial color code to the TextEditingController
    setColor(Colors.blue);
  }

  setColor(ColorSwatch? data) {
    if (data != null) {
      String hexColor = data.value.toRadixString(16);
      // Ensure the hex color has 6 characters (color without alpha)
      if (hexColor.length == 8) {
        hexColor = hexColor.substring(2);
      }
      setState(() {
        colorCodeController.text = hexColor;
      });
    }
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(18.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                setState(() => _mainColor = _tempMainColor);
                print(_mainColor);
                Navigator.of(context).pop();
                setState(() {
                  _mainColor = _tempMainColor;
                  setColor(_mainColor);
                });
              },
              child: const Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }

  void _openMainColorPicker() async {
    _openDialog(
      "Main Color picker",
      MaterialColorPicker(
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () {},
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Update',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage(
                    Assets.images.png.greyAvatar.keyName,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Image",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    ChooseButton(buttonText: 'Choose File', onPressed: () {}),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Branding Color',
              style: CustomTextStyle.paragraphSmall.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.nutralBlack1,
                // fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        colorCodeController.text,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack1,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _openMainColorPicker();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 18.w,
                                  decoration: BoxDecoration(
                                    color: _mainColor,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: const Text(''),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.nutralBlack2,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.white3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hint: 'Enter brand slogan',
              label: 'Brand Slogan',
              onChanged: (v) {},
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
