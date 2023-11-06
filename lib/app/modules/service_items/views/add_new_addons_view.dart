import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/add_new_addons_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/new_addon_body.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';

class AddNewAddonsView extends StatefulWidget {
  const AddNewAddonsView({super.key});

  @override
  State<AddNewAddonsView> createState() => _AddNewAddonsViewState();
}

class _AddNewAddonsViewState extends State<AddNewAddonsView> {
  final controller = Get.put(AddNewAddonsController());

  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    priceController.dispose();
    descriptionController.dispose();
    titleController.dispose();
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
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: NewAddonBody(
                  priceController: priceController,
                  descriptionController: descriptionController,
                  titleController: titleController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
