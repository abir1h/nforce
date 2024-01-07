import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

GlobalKey<FormState> addOrEditServiceCategory = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceCatalogs extends StatefulWidget {
  const BusinessManagerAddOrEditServiceCatalogs({
    super.key,
    this.serviceCatalog,
  });
  final MockServiceCatalog? serviceCatalog;

  @override
  State<BusinessManagerAddOrEditServiceCatalogs> createState() => _BusinessManagerAddOrEditServiceCatalogsState();
}

class _BusinessManagerAddOrEditServiceCatalogsState extends State<BusinessManagerAddOrEditServiceCatalogs> {
  String? name;
  String? refCode;
  String? parentCategory;
  String? googleTaxonomy;
  String? displayOrder;
  String? termsAndPolicies;
  String? tags;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController refCodeController = TextEditingController();
  TextEditingController googleTaxonomyController = TextEditingController();
  TextEditingController displayOrderController = TextEditingController();
  TextEditingController termsAndPoliciesController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.serviceCatalog != null) {
      final serviceCatalog = widget.serviceCatalog!;
      nameController.text = serviceCatalog.name;
      refCodeController.text = serviceCatalog.refCode;
      googleTaxonomyController.text = serviceCatalog.googleTaxonomy;
      displayOrderController.text = serviceCatalog.displayOrder;
      termsAndPoliciesController.text = serviceCatalog.termsAndConditions;
      tagsController.text = serviceCatalog.tags;
      descriptionController.text = serviceCatalog.description;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    refCodeController.dispose();
    googleTaxonomyController.dispose();
    displayOrderController.dispose();
    termsAndPoliciesController.dispose();
    tagsController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.serviceCatalog != null ? 'Edit Catalog' : 'Add Catalog',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditServiceCategory,
          child: SizedBox(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  CustomTextField(
                    label: 'Name',
                    hint: 'Enter name',
                    controller: nameController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Ref Code',
                    hint: 'Enter ref code',
                    controller: refCodeController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter ref code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownButton(
                    label: 'Parent Category',
                    items: ['Parent Category 1', 'Parent Category 2', 'Parent Category 3']
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
                        parentCategory = v as String?;
                      });
                    },
                    value: parentCategory,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Google Taxonomy',
                    hint: 'Enter google taxonomy',
                    controller: googleTaxonomyController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter google taxonomy';
                      }
                      return null;
                    },
                  ),
                  Text(
                    'Google Merchant Category ID',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Display Order',
                    hint: 'Enter display order',
                    controller: displayOrderController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter display order';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Terms & Policies',
                    hint: 'Enter terms & policies',
                    controller: termsAndPoliciesController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter terms & policies';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Tags',
                    hint: 'Add tags',
                    controller: tagsController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter tags';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Description',
                    hint: 'Enter description',
                    controller: descriptionController,
                    maxLines: 3,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            if (widget.serviceCatalog == null) {
                              nameController.clear();
                              descriptionController.clear();
                              setState(() {
                                name = null;
                                refCode = null;
                                parentCategory = null;
                                googleTaxonomy = null;
                                displayOrder = null;
                                termsAndPolicies = null;
                                tags = null;
                                description = null;
                              });
                            } else {
                              final serviceCatalog = widget.serviceCatalog!;
                              nameController.text = serviceCatalog.name;
                              refCodeController.text = serviceCatalog.refCode;
                              googleTaxonomyController.text = serviceCatalog.googleTaxonomy;
                              displayOrderController.text = serviceCatalog.displayOrder;
                              termsAndPoliciesController.text = serviceCatalog.termsAndConditions;
                              tagsController.text = serviceCatalog.tags;
                              descriptionController.text = serviceCatalog.description;
                              setState(() {
                                name = serviceCatalog.name;
                                refCode = serviceCatalog.refCode;
                                parentCategory = serviceCatalog.parentCategory;
                                googleTaxonomy = serviceCatalog.googleTaxonomy;
                                displayOrder = serviceCatalog.displayOrder;
                                termsAndPolicies = serviceCatalog.termsAndConditions;
                                tags = serviceCatalog.tags;
                                description = serviceCatalog.description;
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
                            if (!addOrEditServiceCategory.currentState!.validate()) {
                              return;
                            }

                            if (parentCategory == null) {
                              Fluttertoast.showToast(msg: 'Please select parent category');
                              return;
                            }

                            final controller = Get.find<BusinessManagerController>();

                            if (widget.serviceCatalog != null) {
                              controller.serviceCatalogsController.updateServiceCatalog(
                                MockServiceCatalog(
                                  id: widget.serviceCatalog!.id,
                                  name: nameController.text,
                                  googleTaxonomy: googleTaxonomyController.text,
                                  displayOrder: displayOrderController.text,
                                  termsAndConditions: termsAndPoliciesController.text,
                                  tags: tagsController.text,
                                  description: descriptionController.text,
                                  parentCategory: parentCategory ?? '',
                                  refCode: refCodeController.text,
                                ),
                              );
                            } else {
                              controller.serviceCatalogsController.addServiceCatalog(
                                MockServiceCatalog(
                                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                                  name: nameController.text,
                                  googleTaxonomy: googleTaxonomyController.text,
                                  displayOrder: displayOrderController.text,
                                  termsAndConditions: termsAndPoliciesController.text,
                                  tags: tagsController.text,
                                  description: descriptionController.text,
                                  parentCategory: parentCategory ?? '',
                                  refCode: refCodeController.text,
                                ),
                              );
                            }
                            Get.back<void>();
                            Fluttertoast.showToast(msg: 'Service category ${widget.serviceCatalog != null ? 'updated' : 'added'} successfully');
                          },
                          text: widget.serviceCatalog != null ? 'Update' : 'Submit',
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
      ),
    );
  }
}
