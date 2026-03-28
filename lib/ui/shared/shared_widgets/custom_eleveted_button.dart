import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class CustomButtonwidget extends StatelessWidget {
  const CustomButtonwidget({
    super.key,
    this.onPressed,
    required this.title, this.backgroundColor=AppColors.primary,
  });
  final Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(screenWidth(1), screenWidth(7))),
    );
  }
}
