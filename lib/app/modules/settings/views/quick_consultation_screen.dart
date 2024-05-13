import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class QuickConsultationViewScreen extends StatelessWidget {
  const QuickConsultationViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'QuickConsultationView Screen',
      ),
      body: Center(child: Text("QuickConsultationView Screen"),),
    );
  }
}