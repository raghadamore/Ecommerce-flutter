import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:get/get.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.index,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Row(
      children: [
        Obx(
          ()=> RoundedImage(
            isNetworkImage: true,
            imageUrl: controller.cartProduct[index]["image"],
            width: 60,
            height: 60,
            padding: EdgeInsets.all(TSize.sm),
            backgroundColor: AppColors.white,
          ),
        ),
        SizedBox(
          width: TSize.spaceBtwItems,
        ),
        //title price size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleTextWithVerifiedIcon(
                title: controller.cartProduct[index]["brand"],
                fontSize: screenWidth(28),
              ),
              Flexible(
                  child: ProductTitleText(
                title: controller.cartProduct[index]["name"],
                maxLines: 1,
              )),
              //attribut
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Color ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text:controller.cartProduct[index]["color"],
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: controller.cartProduct[index]["size"],
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
