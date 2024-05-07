import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../controllers/customer_language_controller.dart';

class CustomerLanguageView extends GetView<CustomerLanguageController> {
  const CustomerLanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerLanguageController());

    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Language',
        centerTitle: true,
        trailing: [],
      ),
      body:ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final language = controller.languages[index];

          return LanguageCard(language: language);
        },
        separatorBuilder: (_, index) {
          return SizedBox(
            height: 16.h,
          );
        },
        itemCount: controller.languages.length,
        shrinkWrap: true,
      ),
    );
  }
}

class LanguageCard extends StatefulWidget {
  final Language language;

  const LanguageCard({required this.language});

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  final controller = Get.put(CustomerLanguageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: (){
        controller.selectedLanguage.value=widget.language;
      },
      child: Container(
            padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border:
                  Border.all(color: AppColors.languaageCardBorder, width: 1.w),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.r),
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.language.languages.first.flagUrl,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        widget.language.countryName,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            fontFamily: 'Inter'),
                      )
                    ],
                  ),
                ),
                Radio(
                  value: widget.language,
                  groupValue: controller.selectedLanguage.value,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
    ));
  }
}
