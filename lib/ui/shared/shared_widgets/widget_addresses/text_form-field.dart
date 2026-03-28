import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TextFormFiledAdress extends StatelessWidget {
  const TextFormFiledAdress({super.key, required this.icon, required this.labelText});
final IconData icon;
final String labelText;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  labelText: labelText,
                    errorMaxLines: 3,
    prefixIconColor: AppColors.gray,
    suffixIconColor: AppColors.gray,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: TSize.fontSizeMd, color: AppColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: TSize.fontSizeSm, color: AppColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: AppColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.gray),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.gray),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSize.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.red),
    ),
                ),
              );
  }
}