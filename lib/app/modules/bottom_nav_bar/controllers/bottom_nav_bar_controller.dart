import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/views/home_view.dart';
import 'package:nuforce/app/modules/new_orders/views/new_orders_view.dart';
import 'package:nuforce/app/modules/order/views/order_view.dart';
import 'package:nuforce/app/modules/settings/views/settings_view.dart';
import 'package:nuforce/app/modules/today/views/today_view.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/services/user_api_service.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarController extends GetxController {
  final PersistentTabController navController = PersistentTabController();

  @override
  void onInit() {
    super.onInit();
    changeIndex(0);
    getUser();
  }

  bool isLoading = false;
  int currentIndex = 0;
  List<PersistentBottomNavBarItem> items = <PersistentBottomNavBarItem>[];

  List<Widget> screens = [
    const HomeView(),
    const TodayView(),
    const NewOrdersView(),
    const OrderView(),
    const SettingsView(),
  ];
  final appstateController = Get.put(AppState());
  Future<void> getUser() async {
    isLoading = true;
    update();

    final userId = SharedPreferenceService.getUserId();
    if (userId != null) {
      await UserApiService().getUser(userId: userId).then((value) {
        value.fold(
          appstateController.setUser,
          (error) {
            SharedPreferenceService.clear();
            Get.offAllNamed<void>(Routes.AUTH);
            Fluttertoast.showToast(msg: error);
          },
        );
      });
    }

    isLoading = false;
    update();
  }

  void changeIndex(int index) {
    currentIndex = index;
    update();

    items = [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index == 0)
                SvgPicture.asset(
                  Assets.images.svg.home1,
                  height: isIpad ? 40 : null,
                )
              else
                SvgPicture.asset(
                  Assets.images.svg.home0,
                  height: isIpad ? 40 : null,
                ),
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
              if (index == 1)
                SvgPicture.asset(
                  Assets.images.svg.today1,
                  height: isIpad ? 40 : null,
                )
              else
                SvgPicture.asset(
                  Assets.images.svg.today0,
                  height: isIpad ? 40 : null,
                ),
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
        icon: Icon(
          Icons.add,
          color: AppColors.white1,
          size: isIpad ? 40 : null,
        ),
        activeColorPrimary: AppColors.primaryBlue1,
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index == 3)
                SvgPicture.asset(
                  Assets.images.svg.order1,
                  height: isIpad ? 40 : null,
                )
              else
                SvgPicture.asset(
                  Assets.images.svg.order0,
                  height: isIpad ? 40 : null,
                ),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 3 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('Order'),
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
              if (index == 4)
                SvgPicture.asset(
                  Assets.images.svg.settings1,
                  height: isIpad ? 40 : null,
                )
              else
                SvgPicture.asset(
                  Assets.images.svg.settings0,
                  height: isIpad ? 40 : null,
                ),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: CustomTextStyle.paragraphExtraSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == 4 ? AppColors.primaryBlue1 : AppColors.nutralBlack2,
                ),
                child: const Text('Settings'),
              ),
            ],
          ),
        ),
      ),
    ];
    update();
  }
}
