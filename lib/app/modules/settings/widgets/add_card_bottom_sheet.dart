import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/utils/colors.dart';

class AddCardBottomsheet extends StatefulWidget {
  const AddCardBottomsheet({
    super.key,
  });

  @override
  State<AddCardBottomsheet> createState() => _AddCardBottomsheetState();
}

class _AddCardBottomsheetState extends State<AddCardBottomsheet> {
  final controller = Get.put(SubscriptionController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder<SubscriptionController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: mediaQuery.padding.top * 3),
              padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: const Column(
                children: [
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
