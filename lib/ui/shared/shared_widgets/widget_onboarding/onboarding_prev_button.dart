import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view_controller.dart';

class OnboardingPrevButton extends StatelessWidget {
  const OnboardingPrevButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final controller=Get.find<OnboardingViewController>();
    return Positioned(
        left: screenWidth(100),
        bottom: screenWidth(200),
        child: Obx(
          ()=> TextButton(
              
                  
              onPressed: controller.prevPage,
              child:controller.currentPageIndex!=0? const Text("Prev",style: TextStyle(color: AppColors.graywhite),):const SizedBox()),
        ));
  }
}