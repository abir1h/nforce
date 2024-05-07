import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/create_work_order_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  int previousIndex = 0;

  @override
  void initState() {
    super.initState();
    previousIndex = controller.navController.index;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (_) {
        return PersistentTabView(
          context,
          controller: controller.navController,
          screens: controller.screens,
          navBarHeight: 60.h,
          onItemSelected: (value) {
            if (value == 2) {
              controller.navController.index = previousIndex;
              createWorkOrderBottomSheet(context);
              return;
            }
            setState(() {
              previousIndex = controller.navController.index;
            });
            controller.changeIndex(value);
          },
          items: controller.items,
          resizeToAvoidBottomInset: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle.style17,
        );
      },
    );
  }
}
