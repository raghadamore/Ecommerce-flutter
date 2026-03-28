import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TBillingPaymentSetion extends StatelessWidget {
  const TBillingPaymentSetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SectionHeading(title: "Payment Method",buttontitle: "Change",showActionButton: true,onPressed: () {
         
       },),
      const SizedBox(height: TSize.spaceBtwItems/2,),
      Row(
        children: [
          TRoundedContainer(
            width: 60,
            height: 35,
            shoeShadow: false,
            backgroundColor: AppColors.white,
            padding: const EdgeInsets.all(TSize.sm),
            child: Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
          ),
           const SizedBox(width: TSize.spaceBtwItems/2,),
           Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
        ],
      )
       
      ],
    );
  }
}