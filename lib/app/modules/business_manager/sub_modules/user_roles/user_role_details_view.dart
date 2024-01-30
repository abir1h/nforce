import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/add_or_edit_user_role_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/user_roles_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class UserRoleDeatilsView extends StatelessWidget {
  const UserRoleDeatilsView({
    required this.user,
    super.key,
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
              TitleSubtitleMinimal(title: 'Name', subtitle: user.name),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'For', subtitle: user.role),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Access Policy', subtitle: user.accessPolicy),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Access Areas', subtitle: user.accessAreas),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: user.description),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Status', subtitle: user.status),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
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
                        Get
                          ..back<void>()
                          ..to<void>(() => AddOrEditUserRoleView(user: user));
                      },
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
