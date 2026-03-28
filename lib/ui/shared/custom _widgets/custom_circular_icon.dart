import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TCirculeIcon extends StatelessWidget {
  const TCirculeIcon({
    super.key,
    this.width,
    this.height,
    this.size=TSize.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:backgroundColor !=null ?backgroundColor!: AppColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed:onPressed, icon: Icon(icon,size: size,color: AppColors.red,)),
    );
  }
}
