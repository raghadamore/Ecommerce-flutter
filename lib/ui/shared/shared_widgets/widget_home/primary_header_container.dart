
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_curved_widget.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,required  this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCustomCurvedWidget(child:  Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
    children: [
      Positioned(top: -150,right: -240,child: TCircularContainer(backgroundColor: AppColors.white.withOpacity(0.1),)),
      Positioned(bottom: -120,right: -290,child: TCircularContainer(backgroundColor: AppColors.white.withOpacity(0.1),)),
      child,
    ],
        ),
      ),);
  }
}