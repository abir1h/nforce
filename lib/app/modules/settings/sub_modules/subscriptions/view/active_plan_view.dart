import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'subscription_view.dart';
import 'usage.dart';
import '../controller/subscription_controller.dart';
import '../../../views/settings_view.dart';
import '../../../../../../gen/assets.gen.dart';

import '../../../../../utils/colors.dart';
import '../../../widgets/text_card.dart';
import '../../../widgets/visa_card.dart';
import 'installed_plugin.dart';

class ActivePlan extends StatefulWidget {
  const ActivePlan({Key? key});

  @override
  State<ActivePlan> createState() => _ActivePlanState();
}

class _ActivePlanState extends State<ActivePlan>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(SubscriptionController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.nutralBlack1,
          ),
          onPressed: () {
            Get.to(() => const SettingsView());
          },
        ),
        title: Text(
          'Active Plan',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFamily: "Poppins",
            color: AppColors.nutralBlack1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.strokePlan)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      bottomLeft: Radius.circular(8.r)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        Assets.images.png.planbg.keyName,
                                      ),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 21.h, horizontal: 15.w),
                                child: Column(
                                  children: [
                                    Text(
                                      "25",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white1),
                                    ),
                                    Text(
                                      "Days Left",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 11.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Starter Package",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        fontFamily: "Poppins",
                                        color: AppColors.nutralBlack1),
                                  ),
                                  Text(
                                    "Billing Cycle: 1 Month",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins",
                                        color: AppColors.nutralBlack2),
                                  ),
                                  Text(
                                    "Users: 2",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        fontFamily: "Poppins",
                                        color: AppColors.nutralBlack2),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>const SubscriptionView());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.lightYellow,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "Upgrade your  premium Plan by NuForce",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.nutralBlack1),
                              )),
                              const SizedBox(
                                width: 35,
                              ),
                              const TextCard(
                                buttonText: 'Upgrade',
                                bgColor: AppColors.darkYellow,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      VisaCard(
                        onPressed: () {},
                        cardName: "Visa Card",
                        cardNumber: "*******14345",
                        trailling: const TextCard(
                          buttonText: 'Add Card',
                          bgColor: AppColors.primaryBlue1,
                        ),
                        bgColor: AppColors.lightblue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  clipBehavior: Clip.none,
                  decoration:
                      const BoxDecoration(color: AppColors.textFieldBackground),
                  child: TabBar(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue1,
                        fontSize: 16.sp,
                        fontFamily: "Poppins"),
                    indicatorColor: AppColors.primaryBlue1,
                    unselectedLabelColor: AppColors.nutralBlack2,
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Poppins"),

                    // Set the indicator color here

                    tabs: const [
                      Tab(text: 'Usage'),
                      Tab(text: 'Installed Plugins'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Usage(),
                      InstalledPlugin()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
