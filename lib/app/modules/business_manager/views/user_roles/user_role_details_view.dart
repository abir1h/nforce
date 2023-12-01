import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/add_or_edit_user_role_view.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/user_roles_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class UserRoleDeatilsView extends StatelessWidget {
  const UserRoleDeatilsView({
    super.key,
    required this.user,
  });
  final UserRolesMock user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TitleSubtitle(title: 'Name', subtitle: user.name),
              const SizedBox(height: 16),
              TitleSubtitle(title: 'For', subtitle: user.role),
              const SizedBox(height: 16),
              TitleSubtitle(title: 'Access Policy', subtitle: user.accessPolicy),
              const SizedBox(height: 16),
              TitleSubtitle(title: 'Access Areas', subtitle: user.accessAreas),
              const SizedBox(height: 16),
              TitleSubtitle(title: 'Description', subtitle: user.description),
              const SizedBox(height: 16),
              TitleSubtitle(title: 'Status', subtitle: user.status),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                        final controller = Get.find<BusinessManagerController>();
                        controller.userRolesController.removeUserRoles(user);
                        Fluttertoast.showToast(msg: 'User Role Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => AddOrEditUserRoleView(user: user));
                      },
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
