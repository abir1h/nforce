
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/models/chat_data_model.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../utils/colors.dart';
import '../controller/chat_controller.dart';

class ChatDetails extends StatefulWidget {
  final ChatData data;
  const ChatDetails({required this.data, Key? key}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final controller = Get.put(chatController());
  final FocusNode _focusNode = FocusNode();
  ScrollController scrollController=ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(80.h), // Set your preferred app bar height
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.white3,
                  width: 2,
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.nutralBlack1,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 26.w,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      Assets.images.png.personImage.keyName,
                                    ),
                                    backgroundColor:
                                        Colors.grey.withOpacity(.2),
                                  ),
                                  const Positioned(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.data.chatName!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          fontFamily: "Poppins",
                                          color: AppColors.nutralBlack1,
                                        ),
                                      ),
                                      Text(
                                        "Online",
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GetBuilder<chatController>(
          builder: (_) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      itemBuilder: (_, index) {
                        return Align(
                          alignment:
                              widget.data.messages![index].senderId == 'user1'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment:
                                widget.data.messages![index].senderId == 'user1'
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              if (widget.data.messages![index].senderId ==
                                  'user1')
                                const SizedBox()
                              else
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                            Assets
                                                .images.png.personImage.keyName,
                                          ),
                                          backgroundColor:
                                              Colors.grey.withOpacity(.2),
                                        ),
                                        const Positioned(
                                          right: 0,
                                          bottom: -2,
                                          child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor: AppColors.green3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 12.h,),
                                decoration: BoxDecoration(
                                  color:
                                      widget.data.messages![index].senderId ==
                                              'user1'
                                          ? Colors.blue
                                          : AppColors.textFieldBackground,
                                  borderRadius: widget
                                              .data.messages![index].senderId ==
                                          'user1'
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                          bottomLeft: Radius.circular(20.r),
                                        )
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r),
                                        ),
                                ),
                                child: Text(
                                  widget.data.messages![index].text!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    color:
                                        widget.data.messages![index].senderId ==
                                                'user1'
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.h);
                      },
                      itemCount: widget.data.messages!.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          offset: const Offset(0, -3),
                          spreadRadius: 0,
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.textFieldBackground,
                          child: Image.asset(Assets.images.png.link.keyName),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.textFieldBackground,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: TextField(
                                focusNode: _focusNode,
                                onTap: (){
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                },

                                controller: controller.msgController,
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {

                                        if( controller.msgController.text.isNotEmpty) {

                                          controller.addMessage(widget.data.messages, Message(
                                            senderName: "Alice",
                                            senderId: "user1",
                                            text: controller.msgController.text,
                                            timestamp: "2024-02-15T10:30:00Z",
                                            messageId: '343412',
                                          ),);
                                          if (_focusNode.hasFocus) {
                                            _focusNode.unfocus();

                                          }

                                        }
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: AppColors.primaryBlue1,
                                        radius: 10,
                                        child: Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
