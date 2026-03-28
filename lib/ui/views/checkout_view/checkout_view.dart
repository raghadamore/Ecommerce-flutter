import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_cart/cart_items.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_checkout/billing_address_section.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_checkout/billing_payment_section.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_checkout/coupon_code.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/views/success_view/success_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const TCartItems(
                showaddAndRemoveButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //coupon txtfield
              TCouponCode(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //billing section
              TRoundedContainer(
                shoeShadow: false,
                showBorder: true,
                padding: EdgeInsets.all(TSize.md),
                backgroundColor: AppColors.white,
                child: Column(
                  children: [
                    //pricing
                    TBillingPaymentSetion(),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    //divider
                    const Divider(),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    //payment method
                    TBillingAddressSetion(),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    //address
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              double total=0.0;
                  controller.cartProduct.forEach((element) {
                    total+=element["price"]*element["qauntity"];
                  });
                  controller.saveOrder(controller.cartProduct, total);
                  
            },
            child: Text("Checkout")),
      ),
    );
  }
}
