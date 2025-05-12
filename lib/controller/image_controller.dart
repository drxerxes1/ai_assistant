import 'dart:typed_data';

import 'package:ai_assistant/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textController = TextEditingController();

  final status = Status.none.obs;

  final url = <Uint8List>[].obs;

  final imageList = <Uint8List>[].obs;

  Future<void> createAIImage() async {
    final prompt = textController.text.trim();
    if (prompt.isEmpty) return;

    status.value = Status.loading;

    final imageData = await APIs.generateImage(prompt);
    if (imageData != null) {
      // Set the image bytes (Uint8List) to the controller
      url.value = [imageData];
      imageList.add(imageData);
      status.value = Status.complete;
    } else {
      status.value = Status.none;
    }
  }

  // Future<void> searchAIImage() async {
  //   if (textController.text.trim().isNotEmpty) {
  //     status.value = Status.loading;

  //     imageList.value = await APIs.searchAIImage(textController.text);

  //     if (imageList.isEmpty) {
  //       log('Error');

  //       return;
  //     }

  //     url.value = imageList.first;

  //     status.value = Status.complete;
  //   } else {}
  // }
}
