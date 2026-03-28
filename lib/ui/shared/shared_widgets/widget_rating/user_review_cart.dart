import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_rating/rating_bar_indicator.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TUserReviewCart extends StatelessWidget {
  const TUserReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
             children: [
                const  CircleAvatar(backgroundImage: AssetImage(TImages.google),),
                const SizedBox(width: TSize.spaceBtwItems,),
                Text("John Doe",style: Theme.of(context).textTheme.titleLarge,)
             ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItems,),
        //review
        Row(
          children: [
          const  TRatingBarIndictaor(rating: 4),
            const SizedBox(width: TSize.spaceBtwItems,),

            Text("01 Nov,2023",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        ReadMoreText("The user interface of the app is quite intutive.I was able to navigate and make purchases seamlessly. Great job!.",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: "show more",
        trimExpandedText: "show less",
        moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blue),
        lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blue) ,
        ),
          SizedBox(
                height: TSize.spaceBtwItems,
              ),
        //comany review
        TRoundedContainer(
          shoeShadow: false,
          backgroundColor: const Color.fromARGB(255, 172, 173, 173),
          child: Padding(padding: EdgeInsets.all(TSize.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("T,S Store",style: Theme.of(context).textTheme.titleMedium,),
                      Text("02 Nov,2023",style: Theme.of(context).textTheme.bodyMedium,),
                     
                  ],
                ),
                  SizedBox(
                height: TSize.spaceBtwItems,
              ),
                  ReadMoreText("The user interface of the app is quite intutive.I was able to navigate and make purchases seamlessly. Great job!.",
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: "show more",
        trimExpandedText: "show less",
        moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blue),
        lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.blue) ,
        ),
              ],
            ),
          ),
        ),
         SizedBox(
                height: TSize.spaceBtwSections,
              ),
      ],
    );
  }
}