import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  // Info
  static void info(String message) {
    Get.snackbar(
      'Info',
      message,
      backgroundColor: Colors.blueGrey[800],
      colorText: Colors.blueGrey[50],
      icon: Icon(
        Icons.info,
        color: Colors.blueGrey[50],
      ),
    );
  }

  // Success
  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green[800],
      colorText: Colors.blueGrey[50],
      icon: Icon(
        Icons.check_circle,
        color: Colors.blueGrey[50],
      ),
    );
  }

  // Error
  static void error(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red[800],
      colorText: Colors.blueGrey[50],
      icon: Icon(
        Icons.error,
        color: Colors.blueGrey[50],
      ),
    );
  }

  // Loading
  static void loading() {
    Get.dialog(const Center(
      child: CustomLoading(),
    ));
  }
}
