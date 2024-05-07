import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Invoice Screen',
      ),
      body: Center(child: Text("Invoice Screen"),),
    );
  }
}
