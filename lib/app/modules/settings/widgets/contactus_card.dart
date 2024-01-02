import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/modules/settings/widgets/text_card.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ContactUsCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? bgImage;
  final VoidCallback? ontap;
  const ContactUsCard({
    required this.title,
    required this.subtitle,
    super.key,
    this.bgImage,
    this.ontap,
  });

  @override
  State<ContactUsCard> createState() => _ContactUsCardState();
}

class _ContactUsCardState extends State<ContactUsCard> {
  final controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          border: Border.all(color: AppColors.greyText),
          image: DecorationImage(
            image: AssetImage(widget.bgImage ?? Assets.images.png.grad1.keyName),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              widget.subtitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 12.h,
            ),
            const TextCard(buttonText: 'Contact us'),
          ],
        ),
      ),
    );
  }
}
