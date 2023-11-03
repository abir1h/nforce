import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class AddonDetailsView extends StatefulWidget {
  const AddonDetailsView({super.key});

  @override
  State<AddonDetailsView> createState() => _AddonDetailsViewState();
}

class _AddonDetailsViewState extends State<AddonDetailsView> {
  int _current = 0;
  List<Color> listColor = [AppColors.primaryBlue1, AppColors.primaryBlue2, AppColors.primaryBlue3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Details',
        trailing: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.primaryBlue1,
                  ),
                  child: Center(
                    child: Text(
                      'Install',
                      style: TextStyle(
                        color: AppColors.white1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSizes.horizontalPadding),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: listColor.map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: i,
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 180,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white1,
                        ),
                        child: Text(
                          '${_current + 1}/${listColor.length}',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'QuickBooks Customer Sync',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ExpandableText(
                'Pellentesque pharetra fermentum sit cras. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc, Pellentesque pharetra fermentum sit cras. Sed volutpat pulvinar est faucibus. Adipiscing volutpat pharetra nunc',
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
              const SizedBox(height: 24),
              Text(
                'Features',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar \n\u2022 Easily uploadpharetra fermentum sit cras. Sed volutpat pulvinar ',
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
