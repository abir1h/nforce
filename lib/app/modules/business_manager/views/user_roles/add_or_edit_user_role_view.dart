import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/user_roles_controller.dart';
import 'package:nuforce/app/modules/business_manager/widgets/image_upload_optional.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

GlobalKey<FormState> addRoleFormField = GlobalKey<FormState>();

class AddOrEditUserRoleView extends StatefulWidget {
  const AddOrEditUserRoleView({
    super.key,
    this.user,
  });
  final UserRolesMock? user;

  @override
  State<AddOrEditUserRoleView> createState() => _AddOrEditUserRoleViewState();
}

class _AddOrEditUserRoleViewState extends State<AddOrEditUserRoleView> {
  XFile? image;
  String? role;
  String? accessPolicy;
  String? status;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController accessAreasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      final user = widget.user!;
      nameController.text = user.name;
      descriptionController.text = user.description;
      accessAreasController.text = user.accessAreas;
      role = user.role;
      accessPolicy = user.accessPolicy;
      status = user.status;
      image = XFile(user.image.path);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    accessAreasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.user != null ? 'Edit Role' : 'Add Role',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
          child: Form(
            key: addRoleFormField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageUploadOptional(
                  image: image,
                  onImageRemoveButtonTap: () {
                    setState(() {
                      image = null;
                    });
                  },
                  ontap: () async {
                    await pickImage(ImageSource.gallery).then((value) {
                      image = value;
                    });
                    setState(() {});
                  },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  label: 'Name *',
                  hint: 'Enter display name',
                  controller: nameController,
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
                  items: ['Office Role', 'Representive', 'Manager', 'Admin']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  hint: 'Select one',
                  onChanged: (v) {
                    setState(() {
                      role = v as String?;
                    });
                  },
                  value: role,
                ),
                const SizedBox(height: 16),
                CustomDropdownButton(
                  label: 'Access Policy',
                  hint: 'Select one',
                  onChanged: (p0) {
                    setState(() {
                      accessPolicy = p0 as String?;
                    });
                  },
                  value: accessPolicy,
                  items: ['Policy1', 'Policy2', 'Policy3']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14,
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
                  label: 'Description',
                  hint: 'Enter description',
                  maxLines: 3,
                  controller: descriptionController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Access Areas',
                  hint: 'Enter access areas',
                  controller: accessAreasController,
                ),
                const SizedBox(height: 16),
                CustomDropdownButton(
                  label: 'Status',
                  items: ['Active', 'Inactive']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  hint: 'Select status',
                  onChanged: (v) {
                    setState(() {
                      status = v as String?;
                    });
                  },
                  value: status,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        onPressed: () {
                          if (widget.user == null) {
                            nameController.clear();
                            descriptionController.clear();
                            accessAreasController.clear();
                            setState(() {
                              image = null;
                              role = null;
                              accessPolicy = null;
                              status = null;
                            });
                          } else {
                            final user = widget.user!;
                            nameController.text = user.name;
                            descriptionController.text = user.description;
                            accessAreasController.text = user.accessAreas;
                            setState(() {
                              role = user.role;
                              accessPolicy = user.accessPolicy;
                              status = user.status;
                              image = XFile(user.image.path);
                            });
                          }
                        },
                        text: 'Reset',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          if (!addRoleFormField.currentState!.validate()) {
                            return;
                          }
                          final controller = Get.find<BusinessManagerController>();

                          if (widget.user != null) {
                            controller.userRolesController.updateUserRoles(
                              UserRolesMock(
                                id: widget.user!.id,
                                name: nameController.text,
                                role: role!,
                                image: File(image!.path),
                                accessAreas: accessAreasController.text,
                                accessPolicy: accessPolicy!,
                                description: descriptionController.text,
                                status: status!,
                              ),
                            );
                          } else {
                            controller.userRolesController.addUserRoles(
                              UserRolesMock(
                                id: DateTime.now().toString(),
                                name: nameController.text,
                                role: role!,
                                image: File(image!.path),
                                accessAreas: accessAreasController.text,
                                accessPolicy: accessPolicy!,
                                description: descriptionController.text,
                                status: status!,
                              ),
                            );
                          }
                          Get.back();
                        },
                        text: widget.user != null ? 'Update' : 'Submit',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
