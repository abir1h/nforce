import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/modules/settings/widgets/add_card_bottom_sheet.dart';
import 'package:nuforce/app/modules/settings/widgets/visa_card.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: PrimaryButton(
          text: 'Add New Card',
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (context) => const AddCardBottomsheet(),
            );
          },
        ),
      ),
      appBar: const CustomAppbarMinimal(
        title: 'Payment Method',
        centerTitle: true,
      ),
      body: GetBuilder<SubscriptionController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                ListView.separated(
                  itemBuilder: (_, index) {
                    return VisaCard(
                      cardName: 'Visa',
                      cardNumber: controller.cardList[index].cardNumber! as String,
                      onPressed: () {},
                      trailling: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => popupMenuItems,
                        onSelected: (value) {},
                      ),
                      borderColor: AppColors.white3,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                  itemCount: controller.cardList.length,
                  shrinkWrap: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<PopupMenuEntry<int>> popupMenuItems = [
  PopupMenuItem<int>(
    value: 1,
    child: Row(
      children: [
        SvgPicture.asset(
          Assets.images.svg.checkIcon,
          height: 24.h,
          width: 24.h,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          'Make Default',
          style: CustomTextStyle.paragraphExtraSmall.copyWith(
            color: AppColors.subText,
          ),
        ),
      ],
    ),
  ),
  PopupMenuItem<int>(
    value: 2,
    child: Row(
      children: [
        SvgPicture.asset(
          Assets.images.svg.deleteIcon,
          height: 24.h,
          width: 24.h,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          'Delete',
          style: CustomTextStyle.paragraphExtraSmall.copyWith(
            color: AppColors.subText,
          ),
        ),
      ],
    ),
  ),
];
