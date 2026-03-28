
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TCardCounterIcon extends StatelessWidget {
  const TCardCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(onPressed: onPressed, icon: Icon(Icons.shopping_bag,color: iconColor)),
      Positioned(
        right: screenWidth(50),
        top: screenWidth(50),
        child: Container(
          width: screenWidth(25),
          height: screenWidth(25),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(100),
          
          ),
          child: Center(
            child: Text("2",style: TextStyle(color: AppColors.white),),
          ),
        ),
      )
    ],);
  }
}


