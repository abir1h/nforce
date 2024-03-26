import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/colored_checkbox_with_title.dart';
import 'package:nuforce/app/modules/new_orders/controllers/new_work_order_controller.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_contact_search_model.dart';
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

  late final NewWorkOrderController workOrderController;

  final TextEditingController findContactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (NewWorkOrderController().initialized) {
      workOrderController = Get.find<NewWorkOrderController>();
    } else {
      workOrderController = Get.put(NewWorkOrderController());
    }
    workOrderController.getServiceRegion();
    workOrderController.fetchServicePackages();
  }

  @override
  void dispose() {
    findContactController.dispose();
    workOrderController.clearContactSearchList();
    workOrderController.clearServiceRegion();
    workOrderController.clearContactSearchList();
    workOrderController.clearSelectedServicePackage();
    workOrderController.clearSelectedServiceRegion();
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
          GetBuilder<NewWorkOrderController>(
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
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SearchResult(findContactController: findContactController);
                              },
                            );
                          },
                          child: IgnorePointer(
                            ignoring: true,
                            child: CustomTextField(
                              label: 'Find Contact',
                              hint: controller.selectedContact?.name ?? '',
                              controller: null,
                            ),
                          ),
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
                              contactId: controller.selectedContact?.id ?? 0,
                              billingAddressId: controller.contactDetails.address?[0].id ?? 0,
                              serviceId: controller.selectedServicePackage?.id ?? 0,
                              regionId: controller.selectedServiceRegion?.id ?? 0,
                            )
                                .then((value) {
                              if (value) {
                                Get
                                  ..back<void>()
                                  ..to<void>(
                                    () => const CreateInvoiceView(),
                                    transition: Transition.downToUp,
                                    arguments: controller.workOrderSuccessModel.invoice,
                                  );
                              }
                            });
                          },
                          text: 'Create',
                        ),
                        35.h.vSpace,
                      ],
                    ),
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
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GetBuilder<NewWorkOrderController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: findContactController,
                          decoration: const InputDecoration(
                            hintText: 'Search here',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.clearContactSearchList();
                              controller.setShowSearchList(false);
                              return;
                            }
                            controller.contactLookup(value);
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('+ Add Contact'),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                if (controller.selectedContact != null)
                  _contactListTile(
                    contact: controller.selectedContact!,
                    controller: controller,
                    context: context,
                    onTap: () {},
                  ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: controller.showSearchList ? 250.h : 0,
                  width: width - (AppSizes.horizontalPadding * 4),
                  child: controller.showSearchList
                      ? controller.contactSearchList.isEmpty
                          ? const Text('')
                          : controller.contactLoading
                              ? const Center(child: CircularProgressIndicator.adaptive())
                              : Scrollbar(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.contactSearchList.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      final contact = controller.contactSearchList[index];
                                      return _contactListTile(
                                        contact: contact,
                                        controller: controller,
                                        context: context,
                                        onTap: () {
                                          controller.setSelectedContact(contact);
                                          controller.setShowSearchList(false);
                                          findContactController.text = contact.name ?? '';
                                          FocusScope.of(context).unfocus();
                                          controller.getContactDetails();
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  ),
                                )
                      : const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _contactListTile({
    required BuildContext context,
    required WorkOrderContactSearch contact,
    required NewWorkOrderController controller,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(contact.name ?? ''),
          trailing: controller.selectedContact?.id == contact.id
              ? const Icon(
                  Icons.check,
                  color: AppColors.primaryBlue1,
                )
              : const SizedBox.shrink(),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
