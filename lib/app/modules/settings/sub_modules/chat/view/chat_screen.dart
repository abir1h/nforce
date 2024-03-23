import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/controller/chat_controller.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../widgets/chat_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = Get.put(chatController());
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
      appBar: CustomAppbarMinimal(
        title: 'Chat',
        centerTitle: true,
        trailing: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 32.r,
          ),
        ],
      ),
      body: GetBuilder<chatController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  ListView.separated(
                    itemBuilder: (_, index) {
                      return ChatCard(data: controller.chatListDataModel!.conversation?[index],);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.h);
                    },
                    itemCount: controller.chatListDataModel!.conversation!.length,
                    shrinkWrap: true,physics: BouncingScrollPhysics(),
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
