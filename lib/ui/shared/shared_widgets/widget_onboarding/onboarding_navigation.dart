import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view_controller.dart';

class OnboardingNavigation extends StatelessWidget {
  const OnboardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<OnboardingViewController>();
    return Align(alignment: Alignment.bottomCenter,child: Padding(padding:  EdgeInsets.only(bottom: screenWidth(7)),
         child: SmoothPageIndicator(controller: controller.pagecontroller,onDotClicked: controller.dotNavigationClick, count: 3,effect: ExpandingDotsEffect(activeDotColor: AppColors.gray,dotHeight: 6),),
    ));
  }
}