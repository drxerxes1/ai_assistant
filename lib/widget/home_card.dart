import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.blue[50],
      child: Row(
        children: [
          Lottie.asset('assets/lottie/ai_ask_me.json', width: mq.width * 0.3),
          const Spacer(),
          Text(
            'AI Chatbot',
            style: TextStyle(
              fontSize: mq.width * 0.05,
              fontWeight: FontWeight.w500,
              color: Colors.blue[800],
            ),
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
