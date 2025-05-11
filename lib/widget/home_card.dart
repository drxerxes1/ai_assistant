import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Card(
      margin: EdgeInsets.only(bottom: mq.height * 0.02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.deepPurple.withOpacity(0.1),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: homeType.onTap,
        child: Row(
          children: [
            Lottie.asset(homeType.lottie, width: mq.width * 0.3),
            const Spacer(),
            Text(
              homeType.name,
              style: TextStyle(
                fontSize: mq.width * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    ).animate().fade(duration: 1.seconds);
  }
}
