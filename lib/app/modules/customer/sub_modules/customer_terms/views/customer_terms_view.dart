import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../controllers/customer_terms_controller.dart';

class CustomerTermsView extends GetView<CustomerTermsController> {
  const CustomerTermsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerTermsController());

    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'FAQs',
        centerTitle: true,
        trailing: [],
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: HtmlWidget(controller.data),
      ),
    );
  }
}
