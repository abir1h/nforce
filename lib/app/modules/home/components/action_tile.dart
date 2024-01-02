import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class ActionsTile extends StatelessWidget {
  const ActionsTile({
    required this.text,
    required this.color,
    required this.onTap,
    required this.isLast,
    super.key,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 38,
                          width: 82,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '565',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.nutralBlack1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -1.5,
                          left: -1,
                          child: Container(
                            height: 42,
                            width: 42,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.white1,
                                width: 3,
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.images.svg.coloredCal,
                              colorFilter: ColorFilter.mode(
                                color,
                                BlendMode.srcATop,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: width * 0.4,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.nutralBlack1,
                        ),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(Assets.images.svg.arrowRight),
              ],
            ),
          ),
          if (!isLast)
            Container(
              height: 1,
              width: width,
              color: AppColors.inactiveColor,
            ),
        ],
      ),
    );
  }
}
