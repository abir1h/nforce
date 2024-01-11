import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/secondary_button.dart';
import '../../widgets/choose_button.dart';

class PersonaEdit extends StatelessWidget {
  const PersonaEdit({super.key});

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
                          color: AppColors.nutralBlack1,),
                    ),
                    ChooseButton(buttonText: 'Choose File', onPressed: () {}),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hint: 'Enter agent name',
              label: 'Agent Name',
              onChange: (v) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hint: 'Enter agent greetin',
              label: 'Agent Greeting ',
              onChange: (v) {},
              maxLines: 5,
            ),

          ],
        ),
      ),
    );
  }
}
