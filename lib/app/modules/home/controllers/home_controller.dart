import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  @override
  void onInit() {
    expandableController.value.addListener(() {
      if (expandableController.value.expanded) {
        isExpanded.value = true;
        developer.log('isExpanded.value ${isExpanded.value}');
      } else {
        isExpanded.value = false;
        developer.log('isExpanded.value ${isExpanded.value}');
      }
    });
    super.onInit();
  }

  Rx<MiniTabIndexEnum> miniTabEnum = MiniTabIndexEnum.today.obs;
  Rx<ExpandableController> expandableController = ExpandableController().obs;

  RxBool isExpanded = false.obs;
  // void toggleExpandable() {
  //   isExpanded.value = !isExpanded.value;
  //   expandableController.value.toggle();
  // }

  RxList<MockTaskApi> mockTaskApiList = <MockTaskApi>[
    MockTaskApi(
      time: '4:30 AM',
      title: 'Service call',
      isDone: true,
      color: AppColors.lightBlue,
    ),
    MockTaskApi(
      time: '11:30 AM',
      title: 'Inspection',
      isDone: true,
      color: AppColors.lightGreen,
    ),
    MockTaskApi(
      time: '1:30 AM',
      title: 'Training',
      isDone: true,
      color: AppColors.lightOrange,
    ),
    MockTaskApi(
      time: '3:30 AM',
      title: 'Maintenance',
      isDone: true,
      color: AppColors.lightPink,
    ),
    MockTaskApi(
      time: '4:30 AM',
      title: 'Inspection',
      isDone: false,
      color: AppColors.lightBlue,
    ),
    MockTaskApi(
      time: '5:30 AM',
      title: 'Inspaction',
      isDone: false,
      color: AppColors.lightGreen,
    ),
  ].obs;

  void updateMockApi(int index, bool value) {
    mockTaskApiList[index].isDone = value;
    mockTaskApiList.refresh();
  }
}

enum MiniTabIndexEnum {
  today,
  actions,
  performance,
  invoices,
}

class MockTaskApi {
  String time;
  String title;
  bool isDone;
  Color color;

  MockTaskApi({
    required this.time,
    required this.title,
    required this.isDone,
    required this.color,
  });
}
