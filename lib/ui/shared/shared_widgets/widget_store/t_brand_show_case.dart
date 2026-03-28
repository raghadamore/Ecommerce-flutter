
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/t_brand_card.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });
final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      shoeShadow: false,
      borderColor: AppColors.gray,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
      child: Column(
        children: [
         //  const TBrandCard(showBorder: false,index: ,),
           const SizedBox(height: TSize.spaceBtwItems,),
           Row(
            children: 
              images.map((image) => brandTapProductImageWidget(image, context)).toList(),
            
           )
        ],
      ),
    );
  }
}
 
 Widget brandTapProductImageWidget(String image,context){
   return  Expanded(
                child: TRoundedContainer(
                  height: 100,
                  shoeShadow: false,
                  backgroundColor: AppColors.white,
                  margin: const EdgeInsets.only(right: TSize.sm),
                  padding: const EdgeInsets.all(TSize.md),
                  child: Image(image: AssetImage(image),fit: BoxFit.contain,),
                ),
              );
 }