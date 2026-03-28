import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/container_widget.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_eleveted_button.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_title.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/login_view/login_view_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginViewController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(screenWidth(12)),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(
                  text1: "Welcome",
                  text2: "Back!",
                ),
                MyTextField(
                  hintText: "Email",
                  prefixIcon: Icons.person,
                  controller1: controller.emailController,
                  validator: (value) => validateEmail(value),
                ),
                SizedBox(
                  height: screenWidth(14),
                ),
                MyTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  controller1: controller.passwordController,
                  validator: (value) => validatePassword(value),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: controller.toForetPasswordView,
                        child: Text(
                          "Forget Pssword?",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: screenWidth(24)),
                        )),
                  ],
                ),
                SizedBox(
                  height: screenWidth(13),
                ),
                CustomButtonwidget(
                  onPressed: () => controller.login(),
                  title: "Login",
                ),
                SizedBox(
                  height: screenWidth(7),
                ),
                Center(
                    child: Text(
                  "- OR Continue with -",
                  style: TextStyle(
                      color: AppColors.graywhite, fontSize: screenWidth(24)),
                )),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth(8),
                      ),
                      ContainerWidget(
                        image: TImages.google,
                        onTap: controller.signInWithGoogle,
                      ),
                      const ContainerWidget(
                        image: TImages.apple,
                      ),
                      const ContainerWidget(
                        image: TImages.facebook,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth(6.2),
                    ),
                    Text(
                      "Create An Acount ",
                      style: TextStyle(
                          color: AppColors.graywhite,
                          fontSize: screenWidth(22)),
                    ),
                    InkWell(
                        onTap: controller.toSignup,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: screenWidth(22)),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
