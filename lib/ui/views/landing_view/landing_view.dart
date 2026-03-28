import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_button.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/landing_view/landing_view_controller.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<LandingViewController>();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/pngs/main_background.png',
            width: screenWidth(1),
            fit: BoxFit.fitWidth,
          ),
          Center(
              child: Column(
            children: [
               SizedBox(
                height: screenWidth(4),
              ),
              Image.asset(
                'assets/images/pngs/logo.png',
                width: screenWidth(1.8),
              ),
              SizedBox(
                height: screenWidth(1.3),
              ),
               Padding(
                 padding:  EdgeInsets.only(bottom: screenWidth(50)),
                 child:CustomButton(colors: AppColors.gradientColorButtom, label: 'LOG IN', textColor: AppColors.white,onTap: ()=>Get.to(LoginView()),)

               ),
              CustomButton(label: "SING UP", colors: AppColors.whiteGradiant, textColor: AppColors.gray,)
            ],
          ))
        ],
      ),
    );
  }
}
