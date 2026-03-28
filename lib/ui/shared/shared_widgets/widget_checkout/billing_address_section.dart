import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TBillingAddressSetion extends StatelessWidget {
  const TBillingAddressSetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SectionHeading(title: "Shipping Address",buttontitle: "Change",showActionButton: true,onPressed: () {
         
       },),
      
     Text("Coding with t",style: Theme.of(context).textTheme.bodyLarge,),
const SizedBox(height: TSize.spaceBtwItems/2,),
       Row(
        children: [
          const Icon(Icons.phone,color: AppColors.gray,size: 16,),
          const SizedBox(width: TSize.spaceBtwItems),
           Text("+963-998-998-090",style: Theme.of(context).textTheme.bodyMedium,),
        ]
       ),
       const SizedBox(height: TSize.spaceBtwItems/2,),
       Row(
        children: [
          const Icon(Icons.location_history,color: AppColors.gray,size: 16,),
          const SizedBox(width: TSize.spaceBtwItems),
           Text("South liana,maine 87695,lsa",style: Theme.of(context).textTheme.bodyMedium,softWrap: true,),
        ]
       ),
       const SizedBox(height: TSize.spaceBtwItems/2,),
      ],
    );
  }
}