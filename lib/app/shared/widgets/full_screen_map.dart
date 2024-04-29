import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nuforce/app/shared/controllers/full_screen_map_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'dart:developer' as developer show log;

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
    getLocation();
  }

  final controller = Get.put(FullScreenMapController());

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
    print(userLocation);
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Location',
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
