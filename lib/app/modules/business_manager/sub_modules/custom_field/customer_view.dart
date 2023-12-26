import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/widgets/detail_card.dart';

class Customer_View extends StatelessWidget {
  const Customer_View({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      children: [
        const DetailCard(
          title: "Sales Region dropdown",
          subtitle: "Nearest Sales Region",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Customer_View Ref ID text",
          subtitle: "Internal Reference ID",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Tax Area text",
          subtitle: "Local tax region",
        ),
      ],
    );
  }
}
