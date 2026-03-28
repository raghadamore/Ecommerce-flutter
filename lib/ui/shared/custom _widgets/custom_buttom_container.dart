import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class ButtomContainer extends StatelessWidget {
  const ButtomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenWidth(20), right: screenWidth(5)),
      width: screenWidth(2.5),
      height: screenWidth(120),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white),
    );
  }
}