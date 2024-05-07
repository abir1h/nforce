import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class QuickBookViewScreen extends StatelessWidget {
  const QuickBookViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'QuickBookView Screen',
      ),
      body: Center(child: Text("QuickBookView Screen"),),
    );
  }
}
