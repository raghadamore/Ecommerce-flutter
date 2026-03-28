import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_eleveted_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_title.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/forget_password_view/forget_password_controller.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Padding(
        padding:  EdgeInsets.all(screenWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(text1:"Forget" ,text2: "Password?",),
            MyTextField(hintText: "Enter Your Email Address",prefixIcon: Icons.email,controller1: controller.emailController,),
            SizedBox(height: screenWidth(14),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                 Text("we will send you a message to set or reset",style: TextStyle(color: AppColors.graywhite,fontSize:screenWidth(24)),),
                 Text("your new password",style: TextStyle(color: AppColors.graywhite,fontSize:screenWidth(24)),),
              ],
            ),
            SizedBox(height: screenWidth(8),),
            CustomButtonwidget(onPressed: () {},title: "Submit",),
           
       
          ],
        ),
      )
    );
  }
}






