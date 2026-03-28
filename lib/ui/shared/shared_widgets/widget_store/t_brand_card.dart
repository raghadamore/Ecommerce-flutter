
import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:get/get.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap, required this.index,
  });
final  int index;
final bool showBorder;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    StoreController controller =Get.find<StoreController>();
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.xs),
        showBorder: showBorder,
        backgroundColor: AppColors.white,
        shoeShadow: false,
        child: Obx(
          ()=> Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //icon
              Flexible(
                child: TCircularImage(
                  width: screenWidth(8),
                  height: screenWidth(8),
                  image: controller.brands[index]["image"] ,
                  isNetworkImage: true,
                  backgroundColor: Colors.transparent,
                  overlaycolor: AppColors.black,
                ),
              ),
               SizedBox(
                width:screenWidth(40),
              ),
              //text
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TBrandTitleTextWithVerifiedIcon(
                      title: controller.brands[index]["name"],
                      fontSize: screenWidth(30),
                    ),
                    Text(
                      "${controller.numProduct[controller.brands[index]["name"]]} products",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
