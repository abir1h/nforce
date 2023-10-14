import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/modules/service_items/widgets/rating_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/selected_service_details_tab.dart';
import 'package:nuforce/app/modules/service_items/widgets/total_reviwe_card.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class SelectedServiceItemDetailsView extends StatefulWidget {
  const SelectedServiceItemDetailsView({super.key});

  @override
  State<SelectedServiceItemDetailsView> createState() => _SelectedServiceItemDetailsViewState();
}

class _SelectedServiceItemDetailsViewState extends State<SelectedServiceItemDetailsView> {
  final ServiceItemsController controller = Get.put(ServiceItemsController());
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'AC Hydrowash Service',
        centerTitle: false,
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedServiceDetailsTabs(controller: controller),
            Expanded(child: overviewBody()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Row(
                children: [
                  Expanded(child: SecondaryButton(onPressed: () {}, text: 'Delete')),
                  const SizedBox(width: 15),
                  Expanded(child: PrimaryButton(onPressed: () {}, text: 'Edit')),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget overviewBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.sp,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue3,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const LittleTextWithColoredBG(
                  text: '0',
                  color: AppColors.primaryBlue2,
                ),
                SizedBox(width: 4.sp),
                const LittleTextWithColoredBG(
                  text: 'Service',
                  color: AppColors.primaryBlue1,
                ),
                SizedBox(width: 4.sp),
                const LittleTextWithColoredBG(
                  text: 'IBO4',
                  color: AppColors.primaryBlue2,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primaryBlue1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stat from',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Quantity',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$25.00',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Taxable',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lawn Services',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'No',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.inactiveColor),
            const SizedBox(height: 16),
            Text(
              'What’s Included?',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' • Only Service Charge\n • 7 Days service warranty',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Why Choose Us?',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Your happiness is our goal. Lorem Ipsum is sim ply dummy text of the printing and typese tting industry. Lorem Ipsum has .',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Customer Reviews',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            const TotalReviewCard(),
            Text(
              'Total 22 reviews',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: RatingTile(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
