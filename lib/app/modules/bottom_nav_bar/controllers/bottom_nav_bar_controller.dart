import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/activity/views/activity_view.dart';
import 'package:nuforce/app/modules/home/views/home_view.dart';
import 'package:nuforce/app/modules/more/views/more_view.dart';
import 'package:nuforce/app/modules/new_orders/views/new_orders_view.dart';
import 'package:nuforce/app/modules/today/views/today_view.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarController extends GetxController {
  final PersistentTabController navController = PersistentTabController(initialIndex: 0);

  @override
  void onInit() {
    changeIndex(0);
    super.onInit();
  }

  RxInt currentIndex = 0.obs;
  RxList<PersistentBottomNavBarItem> items = <PersistentBottomNavBarItem>[].obs;

  List<Widget> screens = [
    const HomeView(),
    const TodayView(),
    const NewOrdersView(),
    const ActivityView(),
    const MoreView(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    items.value = [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 0 ? SvgPicture.asset(Assets.images.svg.home1) : SvgPicture.asset(Assets.images.svg.home0),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 0 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 1 ? SvgPicture.asset(Assets.images.svg.today1) : SvgPicture.asset(Assets.images.svg.today0),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 1 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('Today'),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add, color: AppColors.white1),
        activeColorPrimary: AppColors.primaryBlue1,
        // Column(
        //   children: [
        //     const Icon(Icons.add, color: AppColors.white1),
        //     const SizedBox(height: 5),
        //     DefaultTextStyle(
        //       style: CustomTextStyle.paragraphExtraSmall.copyWith(
        //         fontWeight: FontWeight.w600,
        //         color: index == 2 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
        //       ),
        //       child: const Text('New Orders'),
        //     ),
        //   ],
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 3 ? SvgPicture.asset(Assets.images.svg.activity1) : SvgPicture.asset(Assets.images.svg.activity0),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 3 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('Activity'),
              ),
            ],
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 4 ? SvgPicture.asset(Assets.images.svg.more1) : SvgPicture.asset(Assets.images.svg.more0),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 4 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('More'),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
