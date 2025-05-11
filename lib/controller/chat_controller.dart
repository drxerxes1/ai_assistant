import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();

  final messages = <Message>[].obs;

  void chat() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(
          Message(message: textController.text, messageType: MessageType.user));
      messages.add(Message(
          message: 'I received your message', messageType: MessageType.bot));

      textController.clear();
    }
  }
}
