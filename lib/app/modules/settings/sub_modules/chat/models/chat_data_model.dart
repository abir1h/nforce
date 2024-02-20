class ChatList {
  List<ChatData>? conversation;
  ChatList({
    required this.conversation,
  });

  ChatList.fromJson(Map<String, dynamic> json) {
    if (json['conversations'] != null) {
      conversation = <ChatData>[];
      json['conversations'].forEach((v) {
        conversation!.add(ChatData.fromJson(v as Map<String, dynamic>));
      });
    }
  }
}

class ChatData {
  String? chatId;
  String? chatName;
  List<Message>? messages;

  ChatData({this.chatId, this.chatName, this.messages});

  ChatData.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'] as String;
    chatName = json['chatName'] as String;
    if (json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((v) {
        messages!.add(Message.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatId'] = chatId;
    data['chatName'] = chatName;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? messageId;
  String? senderId;
  String? senderName;
  String? text;
  String? timestamp;

  Message(
      {this.messageId,
      this.senderId,
      this.senderName,
      this.text,
      this.timestamp,});

  Message.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'] as String;
    senderId = json['senderId'] as String;
    senderName = json['senderName'] as String;
    text = json['text'] as String;
    timestamp = json['timestamp'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageId'] = messageId;
    data['senderId'] = senderId;
    data['senderName'] = senderName;
    data['text'] = text;
    data['timestamp'] = timestamp;
    return data;
  }
}
