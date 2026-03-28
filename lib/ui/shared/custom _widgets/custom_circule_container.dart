import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width,
    this.height,
     this.radius=TSize.cardRadiusLg,
     this.padding,
     this.child,
     this.backgroundColor=AppColors.white, this.margin,  this.showBorder=false,  this.borderColor=AppColors.white,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width?? screenWidth(1),
      height:height?? screenWidth(1),
      margin:  margin,
      padding:  padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: backgroundColor,
        border: showBorder?Border.all(color:borderColor ):null
      ),
      child: child,
    );
  }
}
