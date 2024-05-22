import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../utils/colors.dart';
import '../controllers/service_center_maps_controller.dart';

class ServiceCenterMapsView extends GetView<ServiceCenterMapsController> {
  const ServiceCenterMapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isIpad ? 0 : 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Map Schedules',
                      style: CustomTextStyle.commonBold.copyWith(color: AppColors.nutralBlack1),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.images.svg.filterOutlined,
                          height: 24.r,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Filter',
                          style: CustomTextStyle.heading5.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Navigate events on the map',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomDropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: 'X',
                      child: Text(
                        '1',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Y',
                      child: Text(
                        '2',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Z',
                      child: Text(
                        '3',
                      ),
                    ),
                  ],
                  hint: 'Select one',
                  onChanged: (newVal) {},
                  value: null,
                ),
              ],
            ),
          ).ifIpad,
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                height: 1.sh,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.red,
                ),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    this.controller.googleMapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(37.7749, -122.4194), // San Francisco coordinates
                    zoom: 12,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('marker_id'),
                      position: LatLng(37.7749, -122.4194), // San Francisco coordinates
                      infoWindow: InfoWindow(title: 'San Francisco'),
                    ),
                  },
                ),
              ).ifIpad,
            ),
          ),
        ],
      ),
    );
  }
}
