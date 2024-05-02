import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/modules/settings/widgets/expanded_list.dart';
import 'package:nuforce/app/modules/settings/widgets/text_card.dart';
import 'package:nuforce/gen/assets.gen.dart';
import '../../../../shared/widgets/custom_dropdown.dart';
import '../../../../utils/text_styles.dart';
import '../../../service_center/sub_modules/work_order_view/sub_modules/over_view/views/edit_work_order.dart';

import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';
import '../../widgets/view_map_bottomsheet.dart';

class PolicySscreen extends StatefulWidget {
  const PolicySscreen({
    super.key,
  });
  @override
  State<PolicySscreen> createState() => _PolicySscreenState();
}

class _PolicySscreenState extends State<PolicySscreen> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PolicyCard()

          
          

        ],
      ),
    );
  }

}
class PolicyCard extends StatelessWidget {
  const PolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1.sw,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.greyStrokColor, width: 1.w)),
      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Agreement of Service',style: TextStyle(
            fontWeight: FontWeight.w600,fontSize: 16.sp,fontFamily: "Poppins",color: AppColors.nutralBlack1
          ),),
          SizedBox(height: 4.h,),
          Text('Another service policy',style: TextStyle(
              fontWeight: FontWeight.w400,fontSize: 14.sp,fontFamily: "Poppins",color: AppColors.nutralBlack2
          ),),          SizedBox(height: 8.h,),

          Container(

            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            decoration: ShapeDecoration(
              color: AppColors.deepYellow,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Text(
              'Pending',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

