import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class AfflaitionViewScreen extends StatelessWidget {
  const AfflaitionViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'AfflaitionView Screen',
      ),
      body: Center(child: Text("AfflaitionView Screen"),),
    );
  }
}
