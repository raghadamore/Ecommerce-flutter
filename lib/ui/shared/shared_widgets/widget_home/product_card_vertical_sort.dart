import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_price_text.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/product_details/product_details.dart';

class TProductCardVerticalSort extends StatelessWidget {
  const TProductCardVerticalSort({super.key, required this.index, required this.product,});
final int index;
final List<QueryDocumentSnapshot> product;
  @override
  Widget build(BuildContext context) {
    StoreController controller=Get.find<StoreController>();
    HomeViewController controller1=Get.find<HomeViewController>();

    return GestureDetector(
      onTap: () => Get.to( ProductDetails(index: index,)),
      child: Container(
        width: screenWidth(2.2),
       
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSize.productImageRadius),
            color: AppColors.white),
        child: Obx(
          ()=> Column(
            children: [
              TCircularContainer(
                height: screenWidth(2.2),
                padding: const EdgeInsets.all(TSize.sm),
                backgroundColor: AppColors.white,
                child: Stack(
                  children: [
                     RoundedImage(
                      isNetworkImage: true,
                      imageUrl: product[index]["image"][0],
                      applyImageRadius: true,
                    ),
                    Positioned(
                      top: screenWidth(40),
                      child: TCircularContainer(
                        
                        radius: TSize.sm,
                        width: screenWidth(8),
                        height: screenWidth(16),
                        backgroundColor: AppColors.yallow.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSize.sm, vertical: TSize.xs),
                        child: Center(
                          child: Text(
                            "${product[index]["discount"].toString()}%" ,
                            style: TextStyle(
                                color: AppColors.black, fontSize: screenWidth(25)),
                          ),
                        ),
                      ),
                    ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: TCirculeIcon(
                          onPressed:()=>controller1.onfavoritePress(index) ,
                          icon:controller1.favorite.contains(product[index])? Icons.favorite:Icons.favorite_border,
                          color: controller1.favorite.contains(product[index])? AppColors.red:AppColors.gray,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: TSize.spaceBtwItems/2,),
              Padding(
                padding: const EdgeInsets.all(TSize.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 ProductTitleText(title:product[index]["name"] ,smallSize: true,),
                   SizedBox(height: TSize.spaceBtwItems/2,),
                   TBrandTitleTextWithVerifiedIcon(title: product[index]["brand"], fontSize: screenWidth(33),),
                 
                  ],
                ),
              ),
              Spacer(),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: TSize.sm),
                        child: ProductPriceText(price:product[index]["price"].toString(),islarge: true,),
                      ),
                      Container(
                        decoration:  BoxDecoration(
                          color: AppColors.graywhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSize.cardRadiusMd),
                            bottomRight: Radius.circular(TSize.productImageRadius)
                          )
          
                        ),
                        child:const  SizedBox(
                          width: TSize.iconLg*1.2,
                          height: TSize.iconLg*1.2,
                          child: Center(child: Icon(Icons.add,color: AppColors.white))),
                      )
                    ],
                   )
            ],
          ),
        ),
      ),
    );
  }
}

