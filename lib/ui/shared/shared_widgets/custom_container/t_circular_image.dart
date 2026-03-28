import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit=BoxFit.cover,
    required this.image,
     this.isNetworkImage=false,
    this.overlaycolor,
    this.backgroundColor,
     this.width=56,
     this.height=56,
     this.padding=TSize.sm,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
              color: backgroundColor,
             
              shape: BoxShape.circle,
              image: DecorationImage(image: 
              NetworkImage(image),fit: BoxFit.cover,)
            ),
     
    );
  }
}
