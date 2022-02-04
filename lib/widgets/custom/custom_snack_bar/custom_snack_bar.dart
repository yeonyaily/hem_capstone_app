import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }
}
