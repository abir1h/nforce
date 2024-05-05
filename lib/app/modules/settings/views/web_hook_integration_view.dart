import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class WebHookIntegrationVIew extends StatelessWidget {
  const WebHookIntegrationVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'WebHookIntegrationVIew Screen',
      ),
      body: Center(child: Text("WebHookIntegrationVIew Screen"),),
    );
  }
}
