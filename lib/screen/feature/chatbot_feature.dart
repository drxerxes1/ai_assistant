import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _controller = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _controller.textController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                hintText: 'Type your message here...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blueGrey[800],
              child: IconButton(
                onPressed: _controller.chat,
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          controller: _controller.scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: mq.height * 0.1,
            top: mq.height * 0.02,
          ),
          children:
              _controller.messages.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
