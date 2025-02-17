import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/add_or_edit_user_role_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/controllers/user_role_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class UserRoleDeatilsView extends StatefulWidget {
  const UserRoleDeatilsView({
    super.key,
    required this.role,
  });
  final Role? role;

  @override
  State<UserRoleDeatilsView> createState() => _UserRoleDeatilsViewState();
}

class _UserRoleDeatilsViewState extends State<UserRoleDeatilsView> {
  // final businessManagerRoleController = Get.find<OrganizationRoleController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserRoleController>(
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppbarMinimal(title: 'Details'),
          body: CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: widget.role?.name ?? 'N/A'),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'For', subtitle: widget.role?.subType ?? 'N/A'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Access Policy', subtitle: widget.role. ?? 'N/A'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Access Areas', subtitle: controller.detailsAccessModulesList.map((e) => e.value).join(', ')),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Description', subtitle: controller.detailsDescriptionController.text),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Status', subtitle: controller.active ? 'Active' : 'Inactive'),
                    // const SizedBox(height: 32),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              // Get.back<void>();
                              // final controller = Get.find<BusinessManagerController>();
                              // controller.userRolesController.removeUserRoles(role);
                              // Fluttertoast.showToast(msg: 'User Role Deleted');

                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return CustomDialog(
                                    dialogType: DialogType.warning,
                                    title: 'Delete Commission Tier?',
                                    content: 'Are you sure you want to delete ${widget.role?.name ?? 'Role'}?',
                                    primaryText: 'Delete',
                                    onPrimaryButtonPress: () async {
                                      Navigator.of(ctx).pop();
                                      final controller = Get.find<UserRoleController>();
                                      await controller.saveEditOrDelete(action: ActionType.delete, id: widget.role?.id).then(
                                        (value) {
                                          if (value) {
                                            Get.back<void>();
                                            Fluttertoast.showToast(msg: 'Role Deleted');
                                          }
                                        },
                                      );
                                    },
                                    secondaryText: 'Cancel',
                                    onSecondaryButtonPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                  );
                                },
                              );
                            },
                            text: 'Delete',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () async {
                              final controller = Get.find<UserRoleController>();
                              await controller.getRoleForm(widget.role?.id);
                              Get
                                ..back()
                                ..to<void>(() => AddOrEditUserRoleView(role: widget.role));
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
          ),
        );
      },
    );
  }
}
