import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/colored_checkbox_with_title.dart';
import 'package:nuforce/app/modules/new_orders/controllers/work_order_controller.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_package_model.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_service_region_model.dart';
import 'package:nuforce/app/modules/new_orders/views/create_invoice_view.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

Future<void> createWorkOrderBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return const CreateOrderWidget();
    },
  );
}

class CreateOrderWidget extends StatefulWidget {
  const CreateOrderWidget({
    super.key,
  });

  @override
  State<CreateOrderWidget> createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget> {
  List<String> serviceRegions = ['Bangladesh', 'USA', 'Canada'];
  List<String> servicePackages = ['Package 1', 'Package 2', 'Package 3'];

  String? selectedServiceRegion;
  String? selectedServicePackage;

  bool isCreateInvoiceSelected = true;

  late final WorkOrderController workOrderServiceRegionController;

  final TextEditingController findContactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (WorkOrderController().initialized) {
      workOrderServiceRegionController = Get.find<WorkOrderController>();
    } else {
      workOrderServiceRegionController = Get.put(WorkOrderController());
    }
    workOrderServiceRegionController.getServiceRegion();
    workOrderServiceRegionController.fetchServicePackages();
  }

  @override
  void dispose() {
    findContactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create Work Order',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.nutralBlack1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.white3, height: 2),
          const SizedBox(height: 16),
          GetBuilder<WorkOrderController>(
            builder: (controller) {
              if (controller.loading) {
                return Column(
                  children: [
                    const Center(child: CircularProgressIndicator()),
                    20.h.vSpace,
                  ],
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButton(
                          label: 'Service Region*',
                          items: controller.serviceRegionModel.serviceRegion
                                  ?.map(
                                    (e) => DropdownMenuItem<ServiceRegion>(
                                      value: e,
                                      child: Text(e.name ?? ''),
                                    ),
                                  )
                                  .toList() ??
                              [],
                          hint: 'Select one',
                          onChanged: (v) {
                            controller.setSelectedServiceRegion(v as ServiceRegion);
                          },
                          value: controller.selectedServiceRegion,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: 'Find Contact',
                          hint: 'Find Contact',
                          controller: findContactController,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.clearContactSearchList();
                              controller.setShowSearchList(false);
                              return;
                            }
                            if (value.length > 2) {
                              controller.contactLookup(value);
                            }
                          },
                        ),
                        Text(
                          'Search customer contact by name',
                          style: TextStyle(
                            color: AppColors.white4,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomDropdownButton(
                          label: 'Service Package',
                          items: controller.servicePackageModel.servicePackage
                                  ?.map(
                                    (e) => DropdownMenuItem<ServicePackage>(
                                      value: e,
                                      child: Text(e.name ?? ''),
                                    ),
                                  )
                                  .toList() ??
                              [],
                          hint: 'Select one',
                          onChanged: (v) {
                            controller.setSelectedServicePackage(v as ServicePackage);
                          },
                          value: controller.selectedServicePackage,
                        ),
                        Text(
                          'Service package to copy line items for estimation (Optional)',
                          style: TextStyle(
                            color: AppColors.white4,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ColoredCheckboxWithTitle(
                              color: AppColors.primaryBlue1,
                              isSelected: isCreateInvoiceSelected,
                              onChanged: (p0) {
                                setState(() {
                                  isCreateInvoiceSelected = p0!;
                                });
                              },
                              title: 'Create Invoice',
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          onPressed: () async {
                            if (controller.contactDetails.address == null || controller.contactDetails.address!.isEmpty) {
                              Fluttertoast.showToast(msg: 'The Selected contact does not have an address');
                              return;
                            }
                            await controller
                                .createWorkOrder(
                              contactId: '${controller.selectedContact?.id ?? 0}',
                              billingAddressId: '${controller.contactDetails.address?[0].id}',
                              serviceId: '${controller.selectedServicePackage?.id ?? 0}',
                              regionId: '${controller.selectedServiceRegion?.id ?? 0}',
                            )
                                .then((value) {
                              if (value) {
                                Get
                                  ..back<void>()
                                  ..to<void>(
                                    () => const CreateInvoiceView(),
                                    transition: Transition.downToUp,
                                  );
                              }
                            });
                          },
                          text: 'Create',
                        ),
                        35.h.vSpace,
                      ],
                    ),
                    Positioned(
                      top: 0.h,
                      left: 0.w,
                      right: 0.w,
                      child: SearchResult(
                        findContactController: findContactController,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    required this.findContactController,
    super.key,
  });

  final TextEditingController findContactController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkOrderController>(
      builder: (controller) {
        if (controller.contactLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.all(8),
          height: controller.showSearchList ? 100.h : 0,
          width: width - (AppSizes.horizontalPadding * 4),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.greyText,
              width: 1,
            ),
          ),
          child: controller.showSearchList
              ? controller.contactSearchList.isEmpty
                  ? const Text('Not found')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.contactSearchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final contact = controller.contactSearchList[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${index + 1}.'),
                            Expanded(
                              child: ListTile(
                                title: Text(contact.name ?? ''),
                                onTap: () {
                                  controller.setSelectedContact(contact);
                                  controller.setShowSearchList(false);
                                  findContactController.text = contact.name ?? '';
                                  FocusScope.of(context).unfocus();
                                  controller.getContactDetails();
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
