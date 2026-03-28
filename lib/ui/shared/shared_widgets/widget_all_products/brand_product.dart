import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_all_products/sort_product.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/t_brand_card.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class BrandsProducts extends StatelessWidget {
  const BrandsProducts({super.key, required this.brand});
final String brand;
  @override
  Widget build(BuildContext context) {
    StoreController controller=Get.find<StoreController>();
    controller.getproduct(brand);
    return Scaffold(
      appBar: TAppBar(title:Text("Nike") ,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
          // TBrandCard(showBorder: true,index: 0,),
            SizedBox(height: TSize.spaceBtwSections,),
            TSortableProducts(brand: brand,),
          ],
        ),
        ),
      ),
    );
  }
}