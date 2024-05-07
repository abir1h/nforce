import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nuforce/app/modules/settings/sub_modules/chat/models/chat_data_model.dart';

class chatController extends GetxController {
  late Map<String, dynamic> jsonData, jsonData2;
  var jsonDataMap;
  ChatList? chatListDataModel;

  TextEditingController msgController = TextEditingController();
  List<ChatList> allChatList = [];
  addMessage(List<Message>? chatList, Message msg) {
    chatList?.add(msg);
    msgController.clear();
    update();
  }

  chatSetter() {
    // Initialize jsonData and jsonDataMap
    jsonData = {
      'conversations': [
        {
          "chatId": "123456789",
          "chatName": "Abir Rahman",
          "messages": [
            {
              "messageId": "1",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "Hi there!",
              "timestamp": "2024-02-15T10:30:00Z",
            },
            {
              "messageId": "2",
              "senderId": "user2",
              "senderName": "Bob",
              "text": "Hello!",
              "timestamp": "2024-02-15T10:32:00Z",
            },
            {
              "messageId": "3",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "How are you?",
              "timestamp": "2024-02-15T10:33:00Z",
            },
            {
              "messageId": "4",
              "senderId": "user2",
              "senderName": "Bob",
              "text": "I'm good, thanks!",
              "timestamp": "2024-02-15T10:35:00Z",
            },
            {
              "messageId": "5",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "That's great to hear!",
              "timestamp": "2024-02-15T10:36:00Z",
            }
          ],
        },
        {
          "chatId": "123456789",
          "chatName": "Shadat Rahman",
          "messages": [
            {
              "messageId": "1",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "Hi there!",
              "timestamp": "2024-02-15T10:30:00Z",
            },
            {
              "messageId": "2",
              "senderId": "user2",
              "senderName": "Bob",
              "text": "Hello!",
              "timestamp": "2024-02-15T10:32:00Z",
            },
            {
              "messageId": "3",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "How are you?",
              "timestamp": "2024-02-15T10:33:00Z",
            },
            {
              "messageId": "4",
              "senderId": "user2",
              "senderName": "Bob",
              "text": "I'm good, thanks!",
              "timestamp": "2024-02-15T10:35:00Z",
            },
            {
              "messageId": "5",
              "senderId": "user1",
              "senderName": "Alice",
              "text": "That's great to hear!",
              "timestamp": "2024-02-15T10:36:00Z",
            }
          ],
        }
      ],
    };
    chatListDataModel = ChatList.fromJson(jsonData);
    allChatList = [chatListDataModel!];
    Logger().i(allChatList[0].conversation![1].messages?[0].text);
    update();

    /* jsonDataMap = json.decode(jsonData as String);
    chatListDataModel = ChatList.fromJson(jsonData);
    // Initialize allChatList
    allChatList = [chatListDataModel!];*/
    print(allChatList);
  }

  @override
  void onInit() {
    chatSetter();
    super.onInit();
  }
}
