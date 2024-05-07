import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';

import '../../../../service_items/widgets/addon_items_widget.dart';
import 'add_plugin_view.dart';

class AddonsView extends StatefulWidget {
  const AddonsView({super.key});

  @override
  State<AddonsView> createState() => _AddonsViewState();
}

class _AddonsViewState extends State<AddonsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Plugins',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.to<void>(() => const AddPluginViewScreen()),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: AddonsItems(),
      ),
    );
  }
}
