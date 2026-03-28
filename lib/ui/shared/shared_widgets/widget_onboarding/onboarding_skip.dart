import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

import '../../../views/onboarding_view/onboarding_view_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<OnboardingViewController>();
    return Positioned(top: screenWidth(9),right: screenWidth(500),child: TextButton(onPressed:controller.skipPage , child: Text("Skip",style: TextStyle(color: AppColors.gray,fontSize: screenWidth(22)))));
  }
}