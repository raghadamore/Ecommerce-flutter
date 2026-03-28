import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
     this.maxLines=1,
    this.textcolor,
    this.iconcolor=AppColors.blue,
    this.textAlign=TextAlign.center, required this.fontSize,
  });
  final String title;
  final int maxLines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: TSize.xs,
        ),
        Icon(
          Icons.verified_rounded,
          color: iconcolor,
          size: TSize.iconXs,
        )
      ],
    );
  }
}
