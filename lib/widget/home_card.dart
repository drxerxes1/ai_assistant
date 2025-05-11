import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: mq.height * 0.02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.blue[50],
      child: Row(
        children: [
          Lottie.asset(homeType.lottie, width: mq.width * 0.3),
          const Spacer(),
          Text(
            homeType.name,
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
