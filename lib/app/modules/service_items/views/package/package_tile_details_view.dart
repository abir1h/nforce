import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/package/add_or_edit_service_pacakge_view.dart';
import 'package:nuforce/app/modules/service_items/views/package/widgets/package_tile_details_info_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class PackageTileDetailsView extends StatefulWidget {
  const PackageTileDetailsView({super.key});

  @override
  State<PackageTileDetailsView> createState() => _PackageTileDetailsViewState();
}

class _PackageTileDetailsViewState extends State<PackageTileDetailsView> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Container(
                    height: 170.h,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.primaryBlue3,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Interior Saping Experts',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              color: AppColors.subText,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Lawn services',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: AppColors.nutralBlack1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service Code',
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Cost',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.subText,
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
                        'AB1425',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$150.00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.nutralBlack1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Divider(color: AppColors.white3),
                  SizedBox(height: 16.h),
                  const PackageTileDetailsInfoWidget(
                    left: 'Minumum Partial Pay.',
                    right: '\$50',
                  ),
                  SizedBox(height: 8.h),
                  const PackageTileDetailsInfoWidget(
                    left: 'Service Discount',
                    right: '10%',
                  ),
                  SizedBox(height: 8.h),
                  const PackageTileDetailsInfoWidget(
                    left: 'Default Label',
                    right: 'N/A',
                  ),
                  SizedBox(height: 8.h),
                  const PackageTileDetailsInfoWidget(
                    left: 'Cancellation Fee',
                    right: '\$20',
                  ),
                  SizedBox(height: 8.h),
                  const PackageTileDetailsInfoWidget(
                    left: 'Available for order',
                    right: 'Active',
                    rightColor: AppColors.green,
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Service Details',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ExpandableText(
                    'Your happiness is our goal. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc, Pellentesque pharetra fermentum sit cras. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc',
                    expandText: 'Read More',
                    collapseText: 'Read Less',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                    linkColor: AppColors.primaryBlue1,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(color: AppColors.white3),
                  SizedBox(height: 16.h),
                  Text(
                    'Terms & Policy',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\u2022 Easily uploadpharetra fermentum sit cras. \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uplo volutpat pulvinar \n\u2022 mentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar ',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            Get.back();
                            Fluttertoast.showToast(msg: 'Service deleted successfully');
                          },
                          text: 'Delete',
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            Get.to(() => const AddOrEditServicePacakgeView(isEdit: true));
                          },
                          text: 'Edit',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
