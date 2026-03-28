import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_price_text.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:get/get.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
            children: [
              //sales tag
              TCircularContainer(
                      
                      radius: TSize.sm,
                      width: screenWidth(8),
                      height: screenWidth(16),
                      backgroundColor: AppColors.yallow.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSize.sm, vertical: TSize.xs),
                      child: Text(
                        "${controller.allproduct[index]["discount"]}%",
                        style: TextStyle(
                            color: AppColors.black, fontSize: screenWidth(25)),
                      ),
                    ),
                    const SizedBox(width: TSize.spaceBtwItems,),
                    //price
                    Text("\$250",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                    SizedBox(width: TSize.spaceBtwItems,),
                    ProductPriceText(price: controller.allproduct[index]["price"].toString(),islarge: true,)
            ],
        ),
        SizedBox(height: TSize.spaceBtwItems/1.5,),
        //title
        ProductTitleText(title: controller.allproduct[index]["brand"]),
        SizedBox(height: TSize.spaceBtwItems/1.5,),
        //stack status
         Row(
           children: [
             ProductTitleText(title: "Status"),
              SizedBox(width: TSize.spaceBtwItems),
             Text("In Stock",style: Theme.of(context).textTheme.titleMedium,),
           ],
         ),
         
        SizedBox(height: TSize.spaceBtwItems/1.5,),
        //brand
        Row(
          children: [
            TCircularImage(image: TImages.google,width: screenWidth(13),height: screenWidth(13),overlaycolor: AppColors.black,),
            TBrandTitleTextWithVerifiedIcon(title: controller.allproduct[index]["brand"], fontSize: screenHeight(70)),
          ],
        )
      ],
    );
  }
}