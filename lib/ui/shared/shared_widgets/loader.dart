import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';

class Loader {
  static warningSnackBar({required Title, message = ""}) {
    Get.snackbar(Title, message,
        isDismissible: true,
      
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
      
        icon: const Icon(
          Icons.warning,
          color: AppColors.white,
          size: 20,
        ));
  }
  static errorSnackBar({required Title, message = ""}) {
    Get.snackbar(Title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(15),
        
        icon: const Icon(
          Icons.warning,
          size: 10,
          color: AppColors.white,
        ));
  }
  static successSnackBar({required Title, message = ""}) {
    Get.snackbar(Title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.white,
        backgroundColor: Color.fromARGB(255, 38, 144, 91),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(15),
        
        icon: const Icon(
          Icons.warning,
          size: 10,
          color: AppColors.white,
        ));
  }
}
