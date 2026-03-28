import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';

import 'package:e_commerce/ui/shared/shared_widgets/widget_order/order_list_item.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_sub_categories/product_cart_horizontial.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key, required this.ind, });
 final int ind;

  @override
  Widget build(BuildContext context) {
        HomeViewController controller=Get.find<HomeViewController>();
        
   
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          controller.data[ind]["name"],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSize.defaultSpace,
          ),
          child: Column(
            children: [
              RoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //sub-categories
              Column(
                children: [
                  SectionHeading(
                    title: "products",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  SizedBox(
                      height: 120,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: TSize.spaceBtwItems,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.product.length,
                          itemBuilder: (contex, index1) =>
                               TProductCardHorizontial(index: index1,))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
