import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(20);

    return message.messageType == MessageType.bot

        // Bot message
        ? Row(
            children: [
              SizedBox(
                width: mq.width * 0.02,
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 24,
                  )),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.7),
                margin: EdgeInsets.only(
                    bottom: mq.height * 0.02, left: mq.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: const BorderRadius.only(
                        topLeft: borderRadius,
                        topRight: borderRadius,
                        bottomRight: borderRadius)),
                child: message.message.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '. . .',
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : Text(message.message,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
              )
            ],
          )
        // User message
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.7),
                margin: EdgeInsets.only(
                    bottom: mq.height * 0.02, right: mq.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: const BorderRadius.only(
                        topLeft: borderRadius,
                        topRight: borderRadius,
                        bottomLeft: borderRadius)),
                child: Text(message.message,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.deepPurple.withOpacity(.1),
                  child: Icon(Icons.person,
                      color: Colors.deepPurple, size: mq.width * 0.06)),
            ],
          );
  }
}
