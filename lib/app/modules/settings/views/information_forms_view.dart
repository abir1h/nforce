import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class InformationFormView extends StatelessWidget {
  const InformationFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'InformationFormView Screen',
      ),
      body: Center(child: Text("InformationFormView Screen"),),
    );
  }
}
