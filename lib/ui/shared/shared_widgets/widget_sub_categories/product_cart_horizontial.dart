import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_price_text.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_sub_categories/add_to_cart_container.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/product_details/product_details.dart';

class TProductCardHorizontial extends StatelessWidget {
  const TProductCardHorizontial({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
        HomeViewController controller=Get.find<HomeViewController>();

    return  GestureDetector(
      onTap: () {
        
      },
      child: Obx(
        ()=> Container(
            width: 310,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(TSize.productImageRadius),
                ),
                color:AppColors.white),
            child: Row(
              children: [
                TRoundedContainer(
                 shoeShadow: false,
                    padding: const EdgeInsets.all(TSize.sm),
                    height: 120,
                    backgroundColor:AppColors.white,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: RoundedImage(
                           isNetworkImage: true,
                              applyImageRadius: true,
                                 
                             imageUrl:controller.product[index]["image"][0],
                            
                          ),
                        ),
                         Positioned(
                          top: 0,
                          child: TRoundedContainer(
                            shoeShadow: false,
                            redius: TSize.sm,
                            backgroundColor: AppColors.yallow.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: TSize.sm,vertical: TSize.xs),
                            child: Text("${controller.product[index]["discount"]}%",style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black),),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: TCirculeIcon(
                            width: screenWidth(10),
                            height: screenWidth(11),
                              icon: Icons.favorite,
                              color: Colors.red,
                             
                          ),
                        ),
                      ],
                    ),
                  
                ),
                SizedBox(
                  width: 172,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductTitleText(
                             
                                title: controller.product[index]["name"],
                                smallSize: true,
                              
                            ),
                            const SizedBox(
                              height: TSize.spaceBtwItems / 2,
                            ),
                             TBrandTitleTextWithVerifiedIcon(
                             
                                 
                                 title: controller.product[index]["brand"], fontSize: screenWidth(28) ,
                              
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ProductPriceText(
                                
                                      price: controller.product[index]["price"].toString())),
                            
                            const AddToCartContainer()
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

