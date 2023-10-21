import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/add_new_service_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/add_new_service_tabs.dart';
import 'package:nuforce/app/modules/service_items/widgets/faq_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/new_service_overview_body.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class AddNewServiceView extends StatefulWidget {
  const AddNewServiceView({super.key});

  @override
  State<AddNewServiceView> createState() => _AddNewServiceViewState();
}

class _AddNewServiceViewState extends State<AddNewServiceView> {
  final controller = Get.put(AddNewServiceController());

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController whatsIncludedController = TextEditingController();
  TextEditingController whyChooseUsController = TextEditingController();
  TextEditingController itemDiscountController = TextEditingController();
  TextEditingController itemDiscountNoteController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    itemNameController.dispose();
    itemDiscountController.dispose();
    itemCodeController.dispose();
    priceController.dispose();
    itemDiscountNoteController.dispose();
    quantityController.dispose();
    whatsIncludedController.dispose();
    whyChooseUsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Add New Services',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddNewServiceTabs(controller: controller),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: Obx(
                  () => controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.overview
                      ? NewServiceOverviewBody(
                          itemNameController: itemNameController,
                          itemCodeController: itemCodeController,
                          priceController: priceController,
                          quantityController: quantityController,
                          whatsIncludedController: whatsIncludedController,
                          itemDiscountNoteController: itemDiscountNoteController,
                        )
                      : controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.addSubItems
                          ? NewServiceOverviewBody(
                              itemNameController: itemNameController,
                              itemCodeController: itemCodeController,
                              priceController: priceController,
                              quantityController: quantityController,
                              whatsIncludedController: whatsIncludedController,
                              itemDiscountNoteController: itemDiscountNoteController,
                            )
                          : controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.content
                              ? const AddNewServiceContentView()
                              : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewServiceContentView extends StatefulWidget {
  const AddNewServiceContentView({super.key});

  @override
  State<AddNewServiceContentView> createState() => _AddNewServiceContentViewState();
}

class _AddNewServiceContentViewState extends State<AddNewServiceContentView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQs',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Question*',
          hint: 'Enter question',
          controller: null,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Answer*',
          hint: 'Enter answer',
          controller: null,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue3,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  'Add new',
                  style: TextStyle(
                    color: AppColors.primaryBlue1,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: FaqTile(),
            );
          },
        ),
        Text(
          'SEO',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        // TODO : Add SEO fields
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Description',
          hint: 'Write description...',
          controller: null,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Specification',
          hint: 'Write specification...',
          controller: null,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Terms of service',
          hint: 'Write terms of service...',
          controller: null,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Requirement for Service',
          hint: 'Write requirement for service...',
          controller: null,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          label: 'Notice of Service',
          hint: 'Write notice of service...',
          controller: null,
        ),
        const SizedBox(height: 24),
        PrimaryButton(onPressed: () {}, text: 'Save'),
        const SizedBox(height: 8),
      ],
    );
  }
}
