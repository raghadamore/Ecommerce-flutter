
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key, required this.image, this.onTap,
  });
final String image;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        margin: EdgeInsets.all(screenWidth(40)),
      width: screenWidth(7.4), // عرض مناسب
      height: screenWidth(7.4),  // ارتفاع مناسب
      decoration: BoxDecoration(
      color: AppColors.pink,
      border: Border.all(color: AppColors.primary),
       // خلفية الزر
      borderRadius: BorderRadius.circular(200),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      ),
      child: Center(
      child:
       Image.asset(image,width: screenWidth(10),
        height: screenWidth(10),
        fit: BoxFit.contain,)
      ),
    ),
    );
  }
}