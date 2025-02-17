import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/package/package_tile_details_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/all_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/package_list_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/searchbox_with_leading_icon.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controllers/service_items_controller.dart';

class PackageItems extends StatefulWidget {
  const PackageItems({super.key});

  @override
  State<PackageItems> createState() => _PackageItemsState();
}

class _PackageItemsState extends State<PackageItems> {
  String? dropdownValue;
  List<String> dropdownItems = ['Category 1', 'Category 2', 'Category 3'];
  final controller=Get.put(ServiceItemsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceItemsController>(
        builder: (controller) {
          return controller.dataLoaded?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdownButton(
                items: dropdownItems.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(
                        color: AppColors.subText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                hint: 'Select Category',
                onChanged: (v) {
                  setState(() {
                    dropdownValue = v as String?;
                  });
                },
                value: dropdownValue,
              ),
              SizedBox(height: 14.h),
              const SearchBoxWithLeadingIcon(
                hintText: 'Find by Name...',
                controller: null,
              ),
              SizedBox(height: 24.h),
              Text(
                'Service Package List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.packageItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          Get.to<void>(() => const PackageTileDetailsView());
                        },
                        child:  PackageListTile(data: controller.packageItems[index],),
                      ),
                    );
                  },
                ),
              ),
            ],
          ):const Loader();
        });
  }
}
