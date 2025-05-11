import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  final messages = <Message>[
    Message(
        message: 'Good Day! How can I help you today?',
        messageType: MessageType.bot)
  ].obs;

  Future<void> chat() async {
    if (textController.text.trim().isNotEmpty) {
      messages.add(
          Message(message: textController.text, messageType: MessageType.user));
      messages.add(Message(message: '...', messageType: MessageType.bot));

      final response = await APIs.getAnswer(textController.text);

      messages.removeLast();
      messages.add(Message(message: response, messageType: MessageType.bot));

      textController.clear();
    }
  }
}
