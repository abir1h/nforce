import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/organization_roles/add_or_edit_organization_role_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/organization_roles/controllers/organization_role_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class OrganizationRoleDeatilsView extends StatefulWidget {
  const OrganizationRoleDeatilsView({
    super.key,
  });

  @override
  State<OrganizationRoleDeatilsView> createState() => _OrganizationRoleDeatilsViewState();
}

class _OrganizationRoleDeatilsViewState extends State<OrganizationRoleDeatilsView> {
  // final businessManagerRoleController = Get.find<OrganizationRoleController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrganizationRoleController>(
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
                    TitleSubtitleMinimal(title: 'Name', subtitle: controller.nameController.text), // TODO : implement role name
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'For', subtitle: controller.selectedSubType?.value ?? 'N/A'),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Access Policy', subtitle: controller.selectedAccessPolicy?.value ?? 'N/A'),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Access Areas', subtitle: controller.detailsAccessModulesList.map((e) => e.value).join(', ')),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Description', subtitle: controller.detailsDescriptionController.text),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Status', subtitle: controller.active ? 'Active' : 'Inactive'),
                    const SizedBox(height: 32),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              Get.back<void>();
                              final controller = Get.find<BusinessManagerController>();
                              // TODO: implement delete user role
                              // controller.userRolesController.removeUserRoles(role);
                              Fluttertoast.showToast(msg: 'User Role Deleted');
                            },
                            text: 'Delete',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              // Get
                              //   ..back<void>()
                              //   ..to<void>(() => AddOrEditUserRoleView(role: widget.id));
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
