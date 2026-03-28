import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_all_products/brand_product.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_all_products/sort_product.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/t_brand_card.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class AllBrandView extends StatelessWidget {
  const AllBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    StoreController controller=Get.find<StoreController>();
    return Scaffold(
      appBar: TAppBar(title: Text("Brand",style: TextStyle(color: AppColors.black),),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            SectionHeading(title: "Brands"),
            SizedBox(height: TSize.spaceBtwItems,),
            TGridLayout(itemCount: controller.brands.length,mainAxisEtend: 80, itemBuilder: (context,index)=> TBrandCard(showBorder: true,index: index,onTap: () => Get.off(()=>BrandsProducts(brand: controller.brands[index]["name"],)),))
          ],
        ),),
      ),
    );
  }
}