import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/widgets/detail_card.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      children: [
        const DetailCard(
          title: "Exterior dropdown",
          subtitle: "Service_View premise exterior",
        ),
        SizedBox(
          height: 16.h,
        ),
        const DetailCard(
          title: "Skill Level dropdown",
        ),

      ],
    );
  }
}
