import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/login_view/login_view_controller.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller1;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final IconData? prefixIcon;

  const MyTextField({
    super.key,
    required this.hintText,
    this.controller1,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.find<LoginViewController>();
    // دالة لبناء الـ InputDecoration لأننا نستخدمها مرتين
    InputDecoration buildDecoration(bool hasFocus) {
      return InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: hasFocus ? AppColors.primary : AppColors.graywhite,
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  loginCtrl.obscureText.value = !loginCtrl.obscureText.value;
                },
                icon: Obx(
                  // الأيقونة وحدها داخل Obx لِعرض حالة العين
                  () => Icon(
                    loginCtrl.obscureText.value ? Icons.visibility_off : Icons.visibility,
                    color: hasFocus ? AppColors.primary : AppColors.graywhite,
                  ),
                ),
              )
            : null,
        filled: true,
        fillColor: const Color.fromRGBO(232, 229, 229, 1),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth(20),
          vertical: screenWidth(20),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.graywhite,
          fontSize: screenWidth(26),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
      );
    }

    return Focus(
      child: Builder(builder: (context) {
        final hasFocus = Focus.of(context).hasFocus;

        // لو الحقل باسورد نلف TextFormField بـ Obx ليعيد بناء obscureText
        if (isPassword) {
          return Obx(
            () => TextFormField(
              obscureText: loginCtrl.obscureText.value,
              obscuringCharacter: '*',
              style: TextStyle(color: AppColors.gray),
              controller: controller1,
              validator: validator,
              onChanged: onChanged,
              cursorColor: AppColors.primary,
              decoration: buildDecoration(hasFocus),
            ),
          );
        }

        // أما لو مش باسورد نرجع TextFormField عادي بدون Obx
        return TextFormField(
          obscureText: false,
          style: TextStyle(color: AppColors.gray),
          controller: controller1,
          validator: validator,
          onChanged: onChanged,
          cursorColor: AppColors.primary,
          decoration: buildDecoration(hasFocus),
        );
      }),
    );
  }
}