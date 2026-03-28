import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_curved_widget.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:get/get.dart';
class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.index1,
  });
 final int index1;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    print("000000000000000000000000000000000000000000000000000000");
    print(controller.allproduct[index1]["image"][1]);
    return TCustomCurvedWidget(
      child: Container(
        color: AppColors.white,
        child: Stack(
          children: [
            //main image
            SizedBox(
                height: screenHeight(2.2),
                child: Padding(
                  padding: const EdgeInsets.all(
                      TSize.productImageRadius + 2),
                  child: Center(
                      child: Image(
                          image: AssetImage(TImages.productImage3))),
                )),
            //image slider
            Positioned(
              right: 0,
              bottom: screenHeight(36),
              left: screenHeight(17),
              child: SizedBox(
                height: screenHeight(13),
                width: screenWidth(1),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: TSize.spaceBtwItems,
                        ),
                    itemCount: controller.allproduct[index1]["image"].length,
                    itemBuilder:(_,index)=> RoundedImage(
                      isNetworkImage: true,
                    width: screenHeight(14),
                    backgroundColor: AppColors.white,
                    border: Border.all(color: AppColors.gray),
                    padding: EdgeInsets.all(TSize.sm),
                    imageUrl:controller.allproduct[index1]["image"][index] ),
                    ),
              ),
            ),
            //appbar icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TCirculeIcon(icon: Icons.favorite,color: AppColors.red,)
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
