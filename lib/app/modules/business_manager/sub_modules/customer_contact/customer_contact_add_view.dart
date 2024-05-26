import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/customer_contact_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_list_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_button.dart';
import 'package:nuforce/app/modules/contact/controllers/contact_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomerContactAddView extends StatefulWidget {
  const CustomerContactAddView({super.key});

  @override
  State<CustomerContactAddView> createState() => _CustomerContactAddViewState();
}

class _CustomerContactAddViewState extends State<CustomerContactAddView> {
  final controller = Get.find<CustomerContactController>();

  final contactController = Get.put(ContactController());

  @override
  void initState() {
    super.initState();
    contactController.setContactForm();
  }

  @override
  void dispose() {
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Add Customer Contacts',
        leadingPressed: () {
          Get.to<void>(const CustomerContactListView());
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
