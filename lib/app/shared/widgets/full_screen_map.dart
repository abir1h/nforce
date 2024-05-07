// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nuforce/app/shared/controllers/full_screen_map_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';

import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final controller = Get.put(FullScreenMapController());

  searchlist(int index) {
    return GestureDetector(
      onTap: () => controller.getPlaceDetails(index),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.horizontalPadding),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.places!.predictions![index].description!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Visibility(
              visible: controller.places!.predictions![index].loading!,
              child: const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Location',
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              markers: controller.markers.value,
              initialCameraPosition: CameraPosition(
                target: controller.userLocation.value,
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController gmcontroller) {
                // _controller.complete(controller);
                controller.mapController = gmcontroller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: Column(
              children: [
                20.h.vSpace,
                CustomTextField(
                  hint: 'Search location',
                  keyboardType: TextInputType.text,
                  controller: controller.searchController,
                ),
                Obx(
                  () => SizedBox(
                    height: controller.isSearching.value ? 0 : Get.height * 0.4,
                    child: Stack(
                      children: [
                        controller.places != null
                            ? Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 15,
                                margin: const EdgeInsets.only(top: 5),
                                color: AppColors.white1,
                                child: Container(
                                  child: controller.isSearching.value
                                      ? Container()
                                      : controller.places!.predictions!.isNotEmpty
                                          ? Container(
                                              constraints: BoxConstraints(
                                                minHeight: Get.height * 0.1,
                                                maxHeight: Get.height * 0.4,
                                              ),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                padding: const EdgeInsets.all(0),
                                                itemCount: controller.places!.predictions!.length,
                                                itemBuilder: (context, index) {
                                                  return searchlist(index);
                                                },
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'No location found',
                                                style: TextStyle(
                                                  color: AppColors.agentCardBg1,
                                                ),
                                              ),
                                            ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
