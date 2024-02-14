import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/colored_checkbox_with_title.dart';
import 'package:nuforce/app/modules/new_orders/views/create_invoice_view.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdownButton(
                    label: 'Service Region*',
                    items: serviceRegions
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    hint: 'Select one',
                    onChanged: (v) {
                      setState(() {
                        selectedServiceRegion = v as String;
                      });
                    },
                    value: selectedServiceRegion,
                  ),
                  const SizedBox(height: 16),
                  const CustomTextField(
                    label: 'Find Contact',
                    hint: 'Find Contact',
                    controller: null,
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
                    items: servicePackages
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    hint: 'Select one',
                    onChanged: (v) {
                      setState(() {
                        selectedServicePackage = v as String;
                      });
                    },
                    value: selectedServicePackage,
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
                    onPressed: () {
                      Get
                        ..back<void>()
                        ..to<void>(
                          () => const CreateInvoiceView(),
                          transition: Transition.downToUp,
                        );
                    },
                    text: 'Create',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
