import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/widgets/text_card.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:pinput/pinput.dart';

import '../sub_modules/subscriptions/controller/subscription_controller.dart';
import 'expanded_list.dart';

class SubscriptionCard extends StatefulWidget {
  final String title,subtitle1,subtitle2;
  final String? bgImage;
  final List<String> items;
  const SubscriptionCard({super.key, required this.title, required this.subtitle1, required this.subtitle2, required this.items,  this.bgImage});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  final controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            border: Border.all(color: AppColors.greyText),
            image: DecorationImage(
                image: AssetImage(widget.bgImage??Assets.images.png.grad1.keyName),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              widget.subtitle1,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              widget.subtitle2,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 12.h,
            ),
            ExpandedList(
              header: Text("• ${widget.items[0]}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: AppColors.nutralBlack2)),
              itemList: widget.items,
            ),
            SizedBox(height: 8.h,),
            Divider(thickness: 2,color: AppColors.white4,),
            SizedBox(height: 8.h,),
            Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("80/1mo",style:  TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,fontFamily: 'Poppins',color: AppColors.nutralBlack1),),
                    Text("Save 20/1months",style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: AppColors.nutralBlack2),),

                  ],
                )),
                TextCard(buttonText: "Get Started")
              ],
            )

          ],
        ),
      ),
    );
  }
}


