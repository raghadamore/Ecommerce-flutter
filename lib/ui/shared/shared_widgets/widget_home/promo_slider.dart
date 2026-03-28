
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeViewController());

    return Column(
      children: [
        CarouselSlider(
            items:banners.map((url) => RoundedImage(imageUrl: url)).toList(),
            options: CarouselOptions(
              viewportFraction: 1.2,
              onPageChanged: (index, _) => controller.updatePageIndector(index) ,
            )),
            const SizedBox(height: TSize.spaceBtwItems,),
            Center(
              child: Obx(
                ()=> Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i=0;i<banners.length;i++)  TCircularContainer(width: 20,height: 4,backgroundColor: controller.carousalCurrentIndex==i?AppColors.primary:AppColors.graywhite,margin: EdgeInsets.only(right: 10)),
                   
                  ],
                ),
              ),
            )
      ],
    );
  }
}
