import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/helper/custom_dialog.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();
  final scrollController = ScrollController();

  final messages = <Message>[
    Message(
        message: 'Good Day! How can I help you today?',
        messageType: MessageType.bot)
  ].obs;

  Future<void> chat() async {
    if (textController.text.trim().isNotEmpty) {
      // User
      messages.add(
          Message(message: textController.text, messageType: MessageType.user));
      messages.add(Message(message: '', messageType: MessageType.bot));
      scrollToBottom();

      final response = await APIs.getAnswer(textController.text);

      // Bot
      messages.removeLast();
      messages.add(Message(message: response, messageType: MessageType.bot));
      scrollToBottom();

      textController.clear();
    } else {
      CustomDialog.info('Please enter a message');
    }
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
