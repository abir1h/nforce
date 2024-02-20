import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/models/chat_data_model.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/view/chat_details_screen.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../utils/colors.dart';

class ChatCard extends StatelessWidget {
  final ChatData? data;
  const ChatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatDetails(data: data!));
      },
      child: Container(width: 1.sw,color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          Assets.images.png.personImage.keyName,
                        ),
                        backgroundColor: Colors.grey.withOpacity(.2),
                      ),
                      Positioned(
                        right: 5,
                        bottom: -2,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: AppColors.green3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!.chatName!,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                              color: AppColors.nutralBlack1,
                            ),
                          ),
                          Text(
                            data!.messages?.first.text ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              fontFamily: "Poppins",
                              color: AppColors.nutralBlack2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Just Now",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                fontFamily: "Poppins",
                color: AppColors.nutralBlack2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
