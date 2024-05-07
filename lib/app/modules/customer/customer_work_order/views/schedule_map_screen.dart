import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../utils/colors.dart';
import '../controllers/customer_work_order_controller.dart';
import 'map_filter_bottom_sheet.dart';
class ScheduleMapScreen extends StatefulWidget {
  const ScheduleMapScreen({super.key});

  @override
  State<ScheduleMapScreen> createState() => _ScheduleMapScreenState();
}

class _ScheduleMapScreenState extends State<ScheduleMapScreen> {
  final controller = Get.put(CustomerWorkOrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Schedules List",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "poppins",
                      color: AppColors.nutralBlack1),
                ),
                GestureDetector(
                  onTap: ()=> showCupertinoModalPopup<void>(
                      context: context,
                      builder: (context) => const MapFilterBottomSheet()),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.tabbarColor,


                    ),child: Row(
                    children: [
                      SvgPicture.asset(Assets.images.svg.filterOutlined),
                      SizedBox(width: 6.w,),
                      Text('Filter',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.nutralBlack1,fontSize: 12.sp,fontFamily: 'Poppins'),)
                    ],
                  ),
                  ),
                ),


              ],
            ),
            SizedBox(height: 16.h,),
            Text(
              "Navigate events on the map",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  fontFamily: "poppins",
                  color: AppColors.nutralBlack1),
            ), SizedBox(height: 16.h,),
            CustomDropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 'X',
                  child: Text(
                    'x',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Y',
                  child: Text(
                    'X',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'z',
                  ),
                ),
              ],
              hint: 'Select one',
              onChanged: (newVal) {},
              value: null,
            ),            SizedBox(height: 16.h,),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                height: .5.sh,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  color: AppColors.greyStrokColor,
                ),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    this.controller.googleMapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target:
                    LatLng(37.7749, -122.4194), // San Francisco coordinates
                    zoom: 12,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('marker_id'),
                      position: LatLng(
                          37.7749, -122.4194), // San Francisco coordinates
                      infoWindow: InfoWindow(title: 'San Francisco'),
                    ),
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
