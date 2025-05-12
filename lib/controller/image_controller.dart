import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  final textController = TextEditingController();

  Future<void> chat() async {
    if (textController.text.trim().isNotEmpty) {
      textController.clear();
    }
  }
}
