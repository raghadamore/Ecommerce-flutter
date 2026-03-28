import 'package:e_commerce/ui/views/verification_view/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_eleveted_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_title.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/forget_password_view/forget_password_controller.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerificationController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Padding(
        padding:  EdgeInsets.all(screenWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text("verify your email address!",style: TextStyle(fontSize: screenWidth(10),color: AppColors.black,),),
           Text(email??"",style: TextStyle(fontSize: screenWidth(27),color: AppColors.black,),),
            
            SizedBox(height: screenWidth(14),),
           
            CustomButtonwidget(onPressed: controller.checkEmailVerification,title: "Continue",),
            SizedBox(height: screenWidth(14),),
            CustomButtonwidget(onPressed: controller.sendEmailVerification,title: "Resend Email",backgroundColor: AppColors.graywhite,),
           
       
          ],
        ),
      )
    );
  }
}






