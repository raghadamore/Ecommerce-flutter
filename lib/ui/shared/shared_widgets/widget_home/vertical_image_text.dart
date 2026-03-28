
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title,  this.textColor=AppColors.black, required this.backgroundColor, this.onTap,
  });
final String image,title;
final Color textColor;
final Color backgroundColor;
final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.only(right: TSize.spaceBtwItems,top: TSize.spaceBtwItems,bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
          Container(
            width: screenWidth(5),
            height:  screenWidth(5),
            padding:const EdgeInsets.all(TSize.sm),
            decoration: BoxDecoration(
              color: backgroundColor,
             
              shape: BoxShape.circle,
              image: DecorationImage(image: 
              NetworkImage(image),fit: BoxFit.cover,)
            ),
            
          ),
          const SizedBox(height: TSize.spaceBtwItems/2),
          SizedBox(
            width: 55,
            child: Text(title,style: TextStyle(color: textColor,fontSize: screenWidth(26)),maxLines: 1,overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
      ),
    );
  }
}
