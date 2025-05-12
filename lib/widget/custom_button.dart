import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          backgroundColor: Colors.blueGrey[800],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .2, vertical: mq.height * .02),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
