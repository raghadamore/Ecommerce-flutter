import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_cart/cart_items.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_cart/product_quantity_with_remove_add.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_price_text.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/rounded_image.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/checkout_view/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),
        child: TCartItems(),
      ),
     bottomNavigationBar: Padding(
       padding: const EdgeInsets.all(TSize.defaultSpace),
       child: ElevatedButton(onPressed: () =>Get.to(()=>const CheckoutView()), child: Text("Checkout")),
     ),
    );
  }
}
