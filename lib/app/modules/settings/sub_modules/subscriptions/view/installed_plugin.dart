import 'package:flutter/material.dart';

import '../../../../service_items/widgets/plugin_item_card.dart';
class InstalledPlugin extends StatefulWidget {
  const InstalledPlugin({super.key});

  @override
  State<InstalledPlugin> createState() => _InstalledPluginState();
}

class _InstalledPluginState extends State<InstalledPlugin> {
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: PluginItemCard(
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
