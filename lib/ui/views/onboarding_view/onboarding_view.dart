import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_navigation.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_next_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_numPage.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_page.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_prev_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_onboarding/onboarding_skip.dart';
import 'package:e_commerce/ui/shared/text_strings.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view_controller.dart';

class OnboradingView extends StatelessWidget {
  const OnboradingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<OnboardingViewController>();
    return Scaffold(
      body:Stack(
        children: [
            PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndictor,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            
            ],

          ),
           const OnBoardingSkip(),
           const OnBoardingNumPage(),
            const  OnboardingNavigation(),
            const  OnboardingNextButton(),
            const  OnboardingPrevButton(),
        ],
      )
      
      
      
      
      
      
      
      
      
      
      
       
    );
  }
}


