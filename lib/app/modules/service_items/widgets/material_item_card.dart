import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/models/service_manager_data_model.dart';
import 'package:nuforce/app/modules/service_items/widgets/bottom_tile_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/utils/colors.dart';

class MaterialItemCard extends StatelessWidget {
  const MaterialItemCard({
    required this.withBottomTitle,
    super.key,
    this.onFavoriteTap,
    this.isFavorite = false,  this.data,
  });

  final bool withBottomTitle;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;
  final ServiceMangerItemModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(
          color: AppColors.primaryBlue3,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90.sp,
                width: 90.sp,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue3,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
              ),
              SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         LittleTextWithColoredBG(
                          text: data!.itemType.toUpperCase(),
                          color: AppColors.yellow,
                        ),
                        SizedBox(width: 4.sp),
                         LittleTextWithColoredBG(
                          text: data!.itemCode,
                          color: AppColors.blue,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: onFavoriteTap,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: AppColors.primaryBlue1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.sp),
                    Text(
                      data!.name,
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data!.categoryName,
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${data!.totalCost.toString()}',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.sp),
                        Text(
                          r'$30.00',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 4.sp),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.nutralBlack1,
                          ),
                          child: Text(
                            '10%',
                            style: TextStyle(
                              color: AppColors.white1,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Qty: ${data!.quantity}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (withBottomTitle)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.sp),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 4.sp),
                    child: const BottomTileWidget(),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
