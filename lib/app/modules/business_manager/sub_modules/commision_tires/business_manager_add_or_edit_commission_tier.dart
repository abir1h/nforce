import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

GlobalKey<FormState> addOrEditCommissionTier = GlobalKey<FormState>();

class BusinessManagerAddOrEditCommissionTier extends StatefulWidget {
  const BusinessManagerAddOrEditCommissionTier({
    super.key,
    this.commissionTier,
  });
  final MockCommissionTier? commissionTier;

  @override
  State<BusinessManagerAddOrEditCommissionTier> createState() => _BusinessManagerAddOrEditCommissionTierState();
}

class _BusinessManagerAddOrEditCommissionTierState extends State<BusinessManagerAddOrEditCommissionTier> {
  String? name;
  String? rate;
  String? firstRate;
  String? description;
  String? source;
  String? rewardOn;

  TextEditingController nameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController firstRateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.commissionTier != null) {
      final commissionTier = widget.commissionTier!;
      nameController.text = commissionTier.tierName;
      rateController.text = commissionTier.rate.toString();
      firstRateController.text = commissionTier.firstRate.toString();
      descriptionController.text = commissionTier.description ?? '';
      name = commissionTier.tierName;
      rate = commissionTier.rate.toString();
      firstRate = commissionTier.firstRate.toString();
      description = commissionTier.description;
      source = commissionTier.source;
      rewardOn = commissionTier.rewardOn;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    rateController.dispose();
    firstRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.commissionTier != null ? 'Edit Commission Tiers' : 'Add Commission Tiers',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: Form(
          key: addOrEditCommissionTier,
          child: SizedBox(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  CustomTextField(
                    label: 'Tier Name*',
                    hint: 'Enter tier name',
                    controller: nameController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter tier name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Rate',
                    hint: 'Enter rate %',
                    controller: rateController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter rate';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'First Rate',
                    hint: 'Enter first rate %',
                    controller: firstRateController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter first rate';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownButton(
                    label: 'Source',
                    items: ['Commission value calculation', 'Source 2', 'Source 3']
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
                        source = v as String?;
                      });
                    },
                    value: source,
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownButton(
                    label: 'Reward On',
                    items: ['Payment Received', 'Reward type 2', 'Reward type 3']
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
                        rewardOn = v as String?;
                      });
                    },
                    value: rewardOn,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Description',
                    hint: 'Enter description',
                    maxLines: 3,
                    controller: descriptionController,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            if (widget.commissionTier == null) {
                              nameController.clear();
                              descriptionController.clear();
                              setState(() {
                                name = null;
                                rate = null;
                                firstRate = null;
                                source = null;
                                rewardOn = null;
                                description = null;
                              });
                            } else {
                              final commission = widget.commissionTier!;
                              nameController.text = commission.tierName;
                              rateController.text = commission.rate.toString();
                              firstRateController.text = commission.firstRate.toString();
                              descriptionController.text = commission.description ?? '';
                              setState(() {
                                name = commission.tierName;
                                rate = commission.rate.toString();
                                firstRate = commission.firstRate.toString();
                                source = commission.source;
                                rewardOn = commission.rewardOn;
                                description = commission.description;
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
                            if (!addOrEditCommissionTier.currentState!.validate()) {
                              return;
                            }

                            final controller = Get.find<BusinessManagerController>();

                            if (widget.commissionTier != null) {
                              controller.commissionTierController.updateCommissionTier(
                                MockCommissionTier(
                                  id: widget.commissionTier!.id,
                                  tierName: nameController.text,
                                  rate: double.parse(rateController.text),
                                  firstRate: double.parse(firstRateController.text),
                                  description: descriptionController.text,
                                  source: source,
                                  rewardOn: rewardOn,
                                ),
                              );
                            } else {
                              controller.commissionTierController.addCommissionTier(
                                MockCommissionTier(
                                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                                  tierName: nameController.text,
                                  rate: double.parse(rateController.text),
                                  firstRate: double.parse(firstRateController.text),
                                  description: descriptionController.text,
                                  source: source,
                                  rewardOn: rewardOn,
                                ),
                              );
                            }
                            Get.back();
                            Fluttertoast.showToast(msg: 'Commission tier ${widget.commissionTier != null ? 'updated' : 'added'} successfully');
                          },
                          text: widget.commissionTier != null ? 'Update' : 'Submit',
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
