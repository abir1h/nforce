import 'dart:developer' as developer show log;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/controllers/chart_controller.dart';
import 'package:nuforce/app/utils/colors.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    expandableController.addListener(() {
      if (expandableController.expanded) {
        isExpanded = true;
        update();
        developer.log('isExpanded.value $isExpanded');
      } else {
        isExpanded = false;
        update();
        developer.log('isExpanded.value $isExpanded');
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  final chartController = Get.put(ChartController());

  bool isExpanded = false;

  MiniTabIndexEnum miniTabEnum = MiniTabIndexEnum.today;
  void updateMiniTabEnum(MiniTabIndexEnum value) {
    miniTabEnum = value;
    update();
  }

  ExpandableController expandableController = ExpandableController();

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
    update();
  }

  List<MockRecommandedActions> mockRecommandeActions = <MockRecommandedActions>[
    MockRecommandedActions(
      text: 'Scheduled items overdue',
      color: AppColors.primaryBlue1,
      onTap: () {},
    ),
    MockRecommandedActions(
      text: 'Unassigned scheduled items to add',
      color: AppColors.primaryBlue2,
      onTap: () {},
    ),
    MockRecommandedActions(
      text: 'Requests ready for review',
      color: AppColors.green,
      onTap: () {},
    ),
    MockRecommandedActions(
      text: 'Approved quotes to convert to jobs',
      color: AppColors.purple,
      onTap: () {},
    ),
    MockRecommandedActions(
      text: 'Recurring job ending with 30 days',
      color: AppColors.orange,
      onTap: () {},
    ),
  ];
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

class MockRecommandedActions {
  String text;
  Color color;
  VoidCallback onTap;

  MockRecommandedActions({
    required this.text,
    required this.color,
    required this.onTap,
  });
}
