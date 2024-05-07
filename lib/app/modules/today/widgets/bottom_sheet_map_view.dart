import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class BottomSheetMapView extends StatelessWidget {
  const BottomSheetMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.h.vSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'View Map',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        10.h.vSpace,
        Expanded(
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14.4746,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(37.42796133580664, -122.085749655962),
              ),
            },
          ),
        ),
      ],
    );
  }
}
