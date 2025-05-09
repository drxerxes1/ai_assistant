import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Lottie
          Lottie.asset('assets/lottie/ai_ask_me.json', height: mq.height * .6),

          // Title

          const Text(
            'Ask me anything',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: .5),
          ),

          SizedBox(
            height: mq.height * .01,
          ),

          // subtitle

          SizedBox(
            width: mq.width * .7,
            child: const Text(
              'I can be your personal assistant, just ask me anything & I will do my best to help you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
            ),
          ),

          const Spacer(),

          // dots

          Wrap(
            spacing: 5,
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.all(5),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          const Spacer(),

          // button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .2, vertical: mq.height * .02),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Text(
              'Next',
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
