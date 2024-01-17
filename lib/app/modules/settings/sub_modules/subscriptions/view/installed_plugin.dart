import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nuforce/app/modules/service_items/widgets/plugin_item_card.dart';
class InstalledPlugin extends StatefulWidget {
  const InstalledPlugin({super.key});

  @override
  State<InstalledPlugin> createState() => _InstalledPluginState();
}

class _InstalledPluginState extends State<InstalledPlugin> {
  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
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
    );
  }
}
