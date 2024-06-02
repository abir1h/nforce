import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/controllers/user_role_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

GlobalKey<FormState> addRoleFormField = GlobalKey<FormState>();

class AddOrEditUserRoleView extends StatefulWidget {
  const AddOrEditUserRoleView({
    super.key,
    this.role,
  });
  final Role? role;

  @override
  State<AddOrEditUserRoleView> createState() => _AddOrEditUserRoleViewState();
}

class _AddOrEditUserRoleViewState extends State<AddOrEditUserRoleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.role != null ? 'Edit Role' : 'Add Role',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: GetBuilder<UserRoleController>(
          builder: (controller) {
            return controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.formBuilder.fieldNames.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String name = controller.formBuilder.fieldNames[index];
                            Widget? widget = controller.formBuilder.widgets[name];
                            if (widget != null && widget.runtimeType == CustomDropdownButton<Option?>) {
                              widget = (widget as CustomDropdownButton<Option?>).copyWith(
                                onChanged: (value) {
                                  controller.updateOnChanged(name, value);
                                },
                                value: controller.formBuilder.dropdownValue[name],
                              );

                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: widget,
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: widget ?? const SizedBox.shrink(),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                controller.saveEditOrDelete(action: ActionType.submit, id: widget.role?.id).then((value) {
                                  if (value) {
                                    Get.back();
                                  }
                                });
                              },
                              text: 'Submit',
                            ),
                          ),
                        ],
                      ),
                      30.h.vSpace,
                    ],
                  );
          },
        ),
      ),
    );
  }
}
