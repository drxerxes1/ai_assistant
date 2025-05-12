import 'dart:developer';
import 'dart:typed_data';

import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/helper/custom_dialog.dart';
import 'package:ai_assistant/helper/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saver_gallery/saver_gallery.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textController = TextEditingController();

  final status = Status.none.obs;

  final url = <Uint8List>[].obs;

  final imageList = <Uint8List>[].obs;

  Future<void> createAIImage() async {
    final prompt = textController.text.trim();
    if (prompt.isEmpty) return CustomDialog.info('Provide a prompt');

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

  void downloadImage() async {
    try {
      // Check if URL is valid
      if (url.isEmpty || url[0].isEmpty) return;

      // Request storage permission
      final hasPermission = await requestPermission();
      if (!hasPermission) {
        CustomDialog.error('Storage permission denied');
        return;
      }

      // Show loading dialog
      CustomDialog.loading();

      // Save the image to the gallery
      final result = await SaverGallery.saveImage(
        url[0], // Uint8List image data
        quality: 100, // Image quality
        fileName: 'ai_image_${DateTime.now().millisecondsSinceEpoch}', skipIfExists: false,
      );

      // Close the loading dialog
      Get.back();

      // Check if the image was saved successfully
      if (result.isSuccess == true) {
        CustomDialog.success('Image saved to gallery');
      } else {
        CustomDialog.error('Failed to save image');
      }
    } catch (e) {
      // Handle any errors that occurred during the process
      Get.back();
      log('Error saving image: $e');
      CustomDialog.error('An error occurred while saving the image');
    }
  }
}
