import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/add_or_edit_user_role_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/user_role_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/user_roles_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/widget/empty_user_role.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class UserRolesView extends StatefulWidget {
  const UserRolesView({super.key});

  @override
  State<UserRolesView> createState() => _UserRolesViewState();
}

class _UserRolesViewState extends State<UserRolesView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserRolesController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'User Roles',
            trailing: [
              controller.userRolesController.userRoles.isEmpty
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => const AddOrEditUserRoleView());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                          const SizedBox(width: 8),
                          Text(
                            'Add New',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.primaryBlue1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
              const SizedBox(width: 16)
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.userRolesController.userRoles.isEmpty
                  ? const EmptyUserRole()
                  : ListView.builder(
                      itemCount: controller.userRolesController.userRoles.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => UserRoleDeatilsView(user: controller.userRolesController.userRoles[index]));
                            },
                            child: UserRoleTile(user: controller.userRolesController.userRoles[index]),
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}

class UserRoleTile extends StatelessWidget {
  const UserRoleTile({
    super.key,
    required this.user,
  });
  final UserRolesMock user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white3),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.file(
                user.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  user.description,
                  style: TextStyle(
                    color: AppColors.subText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.nutralBlack2,
          ),
        ],
      ),
    );
  }
}
