import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../model/onboard.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    final list = [
      Onboard(
          title: 'Ask me anything',
          subtitle:
              'I can be your personal assistant, just ask me anything & I will do my best to help you.',
          lottie: 'ai_ask_me'),
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'I can help you to turn your imagination into reality, I will create a visual representation of your ideas.',
          lottie: 'imagination'),
      Onboard(
          title: 'Translate languages',
          subtitle:
              'I can help you to translate languages, just ask me to translate any text to any language.',
          lottie: 'translate'),
    ];

    return Scaffold(
        body: PageView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (ctx, ind) {
        final isLast = ind == list.length - 1;

        return Column(
          children: [
            // Lottie
            Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .6),

            // Title

            Text(
              list[ind].title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: .5),
            ),

            SizedBox(
              height: mq.height * .01,
            ),

            // subtitle

            SizedBox(
              width: mq.width * .7,
              child: Text(
                list[ind].subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13.5, letterSpacing: .5, color: Colors.black54),
              ),
            ),

            const Spacer(),

            // dots

            Wrap(
              spacing: 5,
              children: List.generate(
                list.length,
                (index) => Container(
                  margin: const EdgeInsets.all(5),
                  width: index == ind ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index == ind ? Colors.blue : Colors.grey,
                    borderRadius: const BorderRadius.all((Radius.circular(5))),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // button
            CustomButton(
                onTap: () {
                  if (isLast) {
                    Get.off(() => const HomeScreen());
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  }
                },
                text: isLast ? 'Finish' : 'Next'),

            const Spacer(),
          ],
        );
      },
    ));
  }
}
