import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final controller=Get.find<OnboardingViewController>();
    return Positioned(
        right: screenWidth(100),
        bottom: screenWidth(200),
        child: Obx(
          ()=> TextButton(
              
                  
              onPressed: controller.nextPage,
              child:controller.currentPageIndex==2? const Text("Get Started",style: TextStyle(color: AppColors.red),):const Text("Next",style: TextStyle(color: AppColors.red),)),
        ));
  }
}