import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../widgets/location_card.dart';

class RouteSuggestionScreen extends StatefulWidget {
  const RouteSuggestionScreen({Key? key});

  @override
  State<RouteSuggestionScreen> createState() => _RouteSuggestionScreenState();
}

class _RouteSuggestionScreenState extends State<RouteSuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Route Suggestions',
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.images.png.mapImage.keyName,
            width: 1.sw,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1.sh,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.textFieldBackground,
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: Container(
                        height: 6.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.white3,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: 1.sw,
                      decoration:
                          const BoxDecoration(color: AppColors.tabbarColor),
                      child: TabBar(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                        ),
                        indicatorColor: AppColors.nutralBlack1,
                        unselectedLabelColor: AppColors.nutralBlack2,
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                        ),
                        indicator: const BoxDecoration(
                          color: AppColors
                              .primaryBlue1, // Set the overlay color for the selected tab
                        ), // Set the indicator color here
                        tabs: const [
                          Tab(
                            text: 'Properties',
                          ),
                          Tab(
                            text: 'Team',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [LocationCard()],
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
