import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/add_or_edit_user_role_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/controllers/user_role_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/user_role_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/widget/empty_user_role.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

class UserRolesView extends StatefulWidget {
  const UserRolesView({super.key});

  @override
  State<UserRolesView> createState() => _UserRolesViewState();
}

class _UserRolesViewState extends State<UserRolesView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserRoleController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'User Roles',
            trailing: [
              if (controller.roleModel?.data?.isEmpty ?? true)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () async {
                    await controller.getRoleForm();
                    Get.to<void>(() => const AddOrEditUserRoleView());
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
                      ),
                    ],
                  ),
                ),
              const SizedBox(width: 16),
            ],
          ),
          body: CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: controller.roleModel?.data?.isEmpty == true
                    ? const EmptyUserRole()
                    : controller.isLoading
                        ? const SizedBox()
                        : ListView.builder(
                            itemCount: controller.roleModel?.data?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final role = controller.roleModel!.data![index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to<void>(() => UserRoleDeatilsView(role: role));
                                  },
                                  child: UserRoleTile(role: role),
                                ),
                              );
                            },
                          ),
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
    required this.role,
    super.key,
  });
  final Role role;

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
              child: const ColoredBox(color: AppColors.primaryBlue1),
              // child: Image.file(
              //   role.image,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role.name ?? '',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  role.subType ?? '',
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
