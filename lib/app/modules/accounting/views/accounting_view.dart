import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

import '../controllers/accounting_controller.dart';

class AccountingView extends GetView<AccountingController> {
  const AccountingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Accounting',
      ),
      body: Center(
        child: Text(
          'In development',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
