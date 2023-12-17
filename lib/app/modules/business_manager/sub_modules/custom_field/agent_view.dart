import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/widgets/detail_card.dart';

class AgentView extends StatefulWidget {
  const AgentView({super.key});

  @override
  State<AgentView> createState() => _AgentViewState();
}

class _AgentViewState extends State<AgentView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      children: [
        const DetailCard(
          title: "Passport No text",
          subtitle: "Country passport no",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "SSN text",
          subtitle: "Social Security No",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Academic Qualification textarea",
          subtitle: "Academic Qualification textarea",
        ),SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Date of Birth date picker",
          subtitle: "Users birth date",
        ),SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Local Resident dropdown",
          subtitle: "Lives locally",
        ),
      ],
    );
  }
}
