import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_eleveted_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_title.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/signup_view/signup_view_controller.dart';

import '../../shared/shared_widgets/container_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<SignupViewController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Padding(
        padding:  EdgeInsets.all(screenWidth(20)),
        child: Form(
          key: controller.signupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(text1:"Create an" ,text2: "account",),
              MyTextField(hintText: "Email",prefixIcon: Icons.person,controller1: controller.usernameController,validator:(value)=> validateEmail(value),),
              SizedBox(height: screenWidth(14),),
              MyTextField(hintText: "Password",isPassword: true,prefixIcon: Icons.lock,controller1: controller.passwordController,validator:(value)=> validatePassword(value),),
              SizedBox(height: screenWidth(14),),
              MyTextField(hintText: "Confirm Password",isPassword: true,prefixIcon: Icons.lock,controller1: controller.confirmPasswordController,validator:(value)=> validateConfirmPassword(value,controller.passwordController),),
              Row(
                children: [
                   Text("By clicking the",style: TextStyle(color: AppColors.graywhite,fontSize:screenWidth(24)),),
                  TextButton(onPressed: () {}, child: Text("Register",style: TextStyle(color: AppColors.primary,fontSize:screenWidth(24)),)),
                  Text(",you agree",style: TextStyle(color: AppColors.graywhite,fontSize:screenWidth(24)),),
          
                ],
              ),
              Text("to the public offer",style: TextStyle(color: AppColors.graywhite,fontSize:screenWidth(24)),),
          
              SizedBox(height: screenWidth(13),),
              CustomButtonwidget(onPressed: () =>controller.signup(),title: "Create Account",),
              SizedBox(height: screenWidth(13),),
              Center(child: Text("- OR Continue with -",style: TextStyle(color: AppColors.graywhite,fontSize: screenWidth(24)),)),
          const SizedBox(height: TSize.spaceBtwItems,),
           Center(
             child: Row(
             
               children: [
               SizedBox(width: screenWidth(8),),
                  ContainerWidget(image: TImages.google,onTap: controller.signInWithGoogle,),
                 const ContainerWidget(image: TImages.apple,),
                 const ContainerWidget(image: TImages.facebook,),
               ],
             ),
           ),
           SizedBox(height: TSize.spaceBtwItems,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(width: screenWidth(10),),
               Text("I Already Have an Account ",style: TextStyle(color: AppColors.graywhite,fontSize: screenWidth(22)),),
               InkWell(onTap: controller.tologin,child: Text("Log in",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: screenWidth(22)),)),
             ],
           )
            ],
          ),
        ),
      )
    );
  }
}