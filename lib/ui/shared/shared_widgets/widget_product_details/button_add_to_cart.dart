import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class ButtonAddToCart extends StatelessWidget {
  const ButtonAddToCart({super.key, required this.product});
final QueryDocumentSnapshot product;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSize.defaultSpace,vertical: TSize.defaultSpace/2),
      decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.only(
        topLeft: Radius.circular(TSize.cardRadiusLg ),
        topRight: Radius.circular(TSize.cardRadiusLg)
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            ()=> Row(
              children: [
                TCirculeIcon(icon: Icons.remove,onPressed: () =>controller.quantity.value!=0? controller.quantity.value-=1:Null,backgroundColor: AppColors.gray,width: 40,height: 40,color: AppColors.white,),
                const SizedBox(width: TSize.spaceBtwItems,),
                 Text(controller.quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: TSize.spaceBtwItems,),
                 TCirculeIcon(icon: Icons.add,onPressed: () => controller.quantity.value+=1,backgroundColor: AppColors.gray,width: 40,height: 40,color: AppColors.white,),
          
              ],
            ),
          ),
          ElevatedButton(onPressed: ()=>controller.addToCart( product),style:ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(TSize.md),
            backgroundColor: AppColors.black,
            side: const BorderSide(color: AppColors.black),

          ) , child: const Text("Add to Cart"))
        ],
      ),
    );
  }
}