import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/faq/controller/faq_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/faq/model/faq_model.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  final controller = Get.put(FAQController());
  List<bool> isExpandedList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'FAQs',
        centerTitle: true,
        trailing: [],
      ),
      body: GetBuilder<FAQController>(
        builder: (_) {    isExpandedList = List.generate(controller.faqList.length, (index) => false);

        return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: "Question*",
                    hint: 'Enter question',
                    controller: controller.qustionController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: "Answer*",
                    hint: 'Enter answer',
                    controller: controller.answerController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addFaq(FaqModel(
                          qustion: controller.qustionController.text,
                          answer: controller.answerController.text,),);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.tabbarColor,
                      ),
                      child: Text(
                        "Add new",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                          color: AppColors.primaryBlue2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ListView.builder(
                    itemCount: controller.faqList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            isExpandedList[index] = isExpanded;
                          });
                        },
                        trailing: SizedBox(),
                        initiallyExpanded: isExpandedList[index],
                        title: Row(
                          children: [
                            Icon(
                              isExpandedList[index]
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text(
                              controller.faqList[index].qustion!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.nutralBlack1,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            child: Text(
                              controller.faqList[index].answer!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.nutralBlack1,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
