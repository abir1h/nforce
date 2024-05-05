import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
class TeamSettingsView extends StatelessWidget {
  const TeamSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'TeamSettingsView Screen',
      ),
      body: Center(child: Text("TeamSettingsView Screen"),),
    );
  }
}
