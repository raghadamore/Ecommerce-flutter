import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_curved_widget.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/button_add_to_cart.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/product_attributes.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/product_image_slider.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/product_meta_data.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/rating_share_widget.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/product_reviews/product_reviews.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Scaffold(
      bottomNavigationBar: ButtonAddToCart(product: controller.allproduct[index]),
      body: SingleChildScrollView(
         
        child: Column(
          children: [
            //product image slider
            TProductImageSlider(index1:index),

            //product details
            Padding(
              padding:EdgeInsets.only(right: TSize.defaultSpace,left: TSize.defaultSpace ,bottom: TSize.defaultSpace ),
              child: Column(
                children: [
                  //rating &store
                  TRatingAndShare(index: index,),
                  //price,title,stock,brand
                  TProductMetaData(index: index,),
                  //attributes
                  TProductAttributes(index:index),
                  const SizedBox(height: TSize.spaceBtwSections,),
                  //chechout button
                  SizedBox( width: double.infinity,child: ElevatedButton( style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(AppColors.blue)), onPressed: () {}, child: Text("Checkout")) ),
                  const SizedBox(height: TSize.spaceBtwSections,),

                  //description
                  const SectionHeading(title: "Description",showActionButton: false,),
                  const SizedBox(height: TSize.spaceBtwItems,),
                  ReadMoreText("this is a product description for blue nike sleeve less vest. there are more things that can be added but i am just procticing and nothimg else.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "show more",
                  trimExpandedText: "Less",
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),

                  const SizedBox(height: TSize.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(title: "Review(199)",showActionButton: false,onPressed: () {},),
                      IconButton(onPressed: () =>Get.to(ProductReviewsView()), icon:  Icon(Icons.arrow_forward_ios,size: screenWidth(20),))
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBtwSections,)
                ],
              ),
               )
          ],
        ),
      ),
    );
  }
}
