
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:get/get.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key, required this.index,
  });
 final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //rating
        Row(
          children: [
            Icon(Icons.star,color: AppColors.yallow,size: screenHeight(28),),
            SizedBox(width: TSize.spaceBtwItems/2,),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: controller.allproduct[index]["rating"].toString(),style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: "(199)")
              ]
            ))
          ],
        ),
        //share button
        IconButton(onPressed: (){}, icon:const Icon(
          Icons.share,size: TSize.iconMd,
        ) )
      ],
    );
  }
}
