import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/activity/views/activity_view.dart';
import 'package:nuforce/app/modules/home/views/home_view.dart';
import 'package:nuforce/app/modules/more/views/more_view.dart';
import 'package:nuforce/app/modules/today/views/today_view.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarController extends GetxController {
  final PersistentTabController navController = PersistentTabController(initialIndex: 0);

  RxInt currentIndex = 0.obs;

  List<Widget> screens = [
    const HomeView(),
    const TodayView(),
    const ActivityView(),
    const ActivityView(),
    const MoreView(),
  ];

  List<PersistentBottomNavBarItem>? items = [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.images.svg.home0),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.images.svg.today0),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.images.svg.today0),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.images.svg.activity0),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.images.svg.more0),
    ),
  ];
}
