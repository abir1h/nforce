import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:nuforce/app/utils/colors.dart';
import '../../../../../../gen/assets.gen.dart';


class ViewMapBottomSheet extends StatefulWidget {
  const ViewMapBottomSheet({
    super.key,
  });

  @override
  State<ViewMapBottomSheet> createState() => _ViewMapBottomSheetState();
}

class _ViewMapBottomSheetState extends State<ViewMapBottomSheet> {
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: mediaQuery.padding.top * 4),
          padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Map',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1),
                  ),
                  IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.clear,color: Colors.grey,))
                ],
              ),Divider(thickness: 1,),
              Expanded(
                child: Container(
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
                      googleMapController = controller;
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
      ),
    );
  }
}
