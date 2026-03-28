
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_cart/cart_item.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_cart/product_quantity_with_remove_add.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_price_text.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,  this.showaddAndRemoveButton=true,
  });
final bool showaddAndRemoveButton;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Obx(
      ()=>ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSize.spaceBtwSections,
        ),
        itemCount: controller.cartProduct.length,
        itemBuilder: (_, index) => Column(
          children: [
            TCartItem(index: index,),
            if(showaddAndRemoveButton) SizedBox(height: TSize.spaceBtwItems,),
         showaddAndRemoveButton?
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 70,),
                         //add remove button
                TProductQuantityWithRemoveAndAdd(index: index,),
                  ],
                ),
              
              ProductPriceText(price: controller.cartProduct[index]["price"].toString())
               
              ],
            ):SizedBox(),
          ],
        ),
      ),
    );
  }
}
