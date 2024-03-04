import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/business_manager/role_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/organization_roles/controllers/organization_role_controller.dart';
import 'package:nuforce/app/modules/business_manager/widgets/image_upload_optional.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

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
  // XFile? image;
  // String? role;
  // String? accessPolicy;
  // String? status;

  // TextEditingController nameController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  // TextEditingController accessAreasController = TextEditingController();

  late final OrganizationRoleController controller;

  @override
  void initState() {
    super.initState();
    if (OrganizationRoleController().initialized) {
      controller = Get.find<OrganizationRoleController>();
    } else {
      controller = Get.put(OrganizationRoleController());
    }
    controller.getFormData();
    // if (widget.user != null) {
    //   final user = widget.user!;
    //   nameController.text = user.name;
    //   descriptionController.text = user.description;
    //   accessAreasController.text = user.accessAreas;
    //   role = user.role;
    //   accessPolicy = user.accessPolicy;
    //   status = user.status;
    //   image = XFile(user.image.path);
    // }
  }

  @override
  void dispose() {
    // nameController.dispose();
    // descriptionController.dispose();
    // accessAreasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.role != null ? 'Edit Role' : 'Add Role',
      ),
      body: GetBuilder<OrganizationRoleController>(builder: (controller) {
        return CustomLoadingWidget(
          isLoading: controller.isLoading,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
              child: Form(
                key: addRoleFormField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageUploadOptional(
                      image: controller.image,
                      onImageRemoveButtonTap: () {
                        controller.removeImage();
                      },
                      ontap: () async {
                        await controller.setImage();
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      label: controller.nameLable,
                      hint: 'Enter display name',
                      controller: controller.nameController,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Please provide relevant information for Name',
                      style: TextStyle(
                        color: AppColors.subText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownButton(
                      label: 'For',
                      items: controller.subTypeList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.label ?? '',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.nutralBlack1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      hint: 'Select one',
                      onChanged: (v) {
                        controller.setSelectedSubType(v as DropdownModel);
                      },
                      value: controller.selectedSubType,
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownButton(
                      label: controller.accessPolicy,
                      hint: 'Select access policy',
                      onChanged: (p0) {
                        controller.setSelectedAccessPolicy(p0 as DropdownModel);
                      },
                      value: controller.selectedAccessPolicy,
                      items: controller.accessPolicyList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.label ?? '',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.nutralBlack1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: controller.detailsDescriptionLabel,
                      hint: 'Enter description',
                      maxLines: 3,
                      controller: controller.detailsDescriptionController,
                    ),
                    const SizedBox(height: 16),
                    MultiSelectDialogField(
                      items: controller.detailsAccessModulesList.map((e) => MultiSelectItem(e, e.label!)).toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (values) {
                        // _selectedAnimals = values;
                      },
                    ),
                    // CustomTextField(
                    //   label: 'Access Areas',
                    //   hint: 'Enter access areas',
                    //   controller: accessAreasController,
                    // ),
                    const SizedBox(height: 16),
                    // CustomDropdownButton(
                    //   label: 'Status',
                    //   items: ['Active', 'Inactive']
                    //       .map(
                    //         (e) => DropdownMenuItem(
                    //           value: e,
                    //           child: Text(
                    //             e,
                    //             style: const TextStyle(
                    //               fontSize: 14,
                    //               color: AppColors.nutralBlack1,
                    //               fontWeight: FontWeight.w400,
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    //   hint: 'Select status',
                    //   onChanged: (v) {
                    //     setState(() {
                    //       status = v as String?;
                    //     });
                    //   },
                    //   value: status,
                    // ),
                    // const SizedBox(height: 32),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: SecondaryButton(
                    //         onPressed: () {
                    //           if (widget.user == null) {
                    //             nameController.clear();
                    //             descriptionController.clear();
                    //             accessAreasController.clear();
                    //             setState(() {
                    //               image = null;
                    //               role = null;
                    //               accessPolicy = null;
                    //               status = null;
                    //             });
                    //           } else {
                    //             final user = widget.user!;
                    //             nameController.text = user.name;
                    //             descriptionController.text = user.description;
                    //             accessAreasController.text = user.accessAreas;
                    //             setState(() {
                    //               role = user.role;
                    //               accessPolicy = user.accessPolicy;
                    //               status = user.status;
                    //               image = XFile(user.image.path);
                    //             });
                    //           }
                    //         },
                    //         text: 'Reset',
                    //       ),
                    //     ),
                    //     const SizedBox(width: 15),
                    //     Expanded(
                    //       child: PrimaryButton(
                    //         onPressed: () {
                    //           if (!addRoleFormField.currentState!.validate()) {
                    //             return;
                    //           }
                    //           final controller = Get.find<BusinessManagerController>();

                    //           if (widget.user != null) {
                    //             controller.userRolesController.updateUserRoles(
                    //               UserRolesMock(
                    //                 id: widget.user!.id,
                    //                 name: nameController.text,
                    //                 role: role!,
                    //                 image: File(image!.path),
                    //                 accessAreas: accessAreasController.text,
                    //                 accessPolicy: accessPolicy!,
                    //                 description: descriptionController.text,
                    //                 status: status!,
                    //               ),
                    //             );
                    //           } else {
                    //             controller.userRolesController.addUserRoles(
                    //               UserRolesMock(
                    //                 id: DateTime.now().toString(),
                    //                 name: nameController.text,
                    //                 role: role!,
                    //                 image: File(image!.path),
                    //                 accessAreas: accessAreasController.text,
                    //                 accessPolicy: accessPolicy!,
                    //                 description: descriptionController.text,
                    //                 status: status!,
                    //               ),
                    //             );
                    //           }
                    //           Get.back<void>();
                    //         },
                    //         text: widget.user != null ? 'Update' : 'Submit',
                    //       ),
                    // ),
                    // ],
                    // ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
