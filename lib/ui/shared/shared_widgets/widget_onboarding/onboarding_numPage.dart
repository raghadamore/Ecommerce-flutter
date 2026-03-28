import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

import '../../../views/onboarding_view/onboarding_view_controller.dart';

class OnBoardingNumPage extends StatelessWidget {
  const OnBoardingNumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<OnboardingViewController>();
    return Positioned(top: screenWidth(7),left: screenWidth(55),child: Obx(()=> Row(
      children: [
        Text((controller.currentPageIndex.value+1).toString(),style: TextStyle(color: AppColors.black,fontSize: screenWidth(22))),
        Text("/3",style: TextStyle(color: AppColors.graywhite,fontSize: screenWidth(22))),
      ],
    )));
  }
}