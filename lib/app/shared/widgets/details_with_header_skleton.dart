import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class DetailsWithHeaderSkleton extends StatelessWidget {
  const DetailsWithHeaderSkleton({
    required this.header,
    required this.body,
    required this.controller,
    super.key,
  });
  final Widget header;
  final Widget body;
  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandablePanel(
          controller: controller,
          collapsed: const SizedBox(),
          theme: const ExpandableThemeData(hasIcon: false, useInkWell: false),
          header: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: header,
              ),
              Container(
                height: 3,
                color: Colors.transparent,
              ),
            ],
          ),
          expanded: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: body,
          ),
        ),
      ],
    );
  }
}
