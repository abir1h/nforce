import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/widgets/detail_card.dart';

class PreorderView extends StatefulWidget {
  const PreorderView({super.key});

  @override
  State<PreorderView> createState() => _PreorderViewState();
}

class _PreorderViewState extends State<PreorderView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      children: [
        const DetailCard(
          title: "Incident Premise dropdown",
          subtitle: "Location where the incident reported",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "First Responder text",
          subtitle: "Name of the first responder",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Promo Code text",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Payment Details text",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Omar text area",
          subtitle:
              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
        ),
      ],
    );
  }
}
