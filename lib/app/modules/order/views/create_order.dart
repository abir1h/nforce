import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Create Order',
      ),
      body: Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
