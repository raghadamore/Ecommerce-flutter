import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical_fav.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical_sort.dart';
import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/t_brand_show_case.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key,});

  @override
  Widget build(BuildContext context) {
    StoreController controller=Get.find<StoreController>();
   
    return  ListView(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      children:[
        
        Padding(padding: const EdgeInsets.all(TSize.defaultSpace),

                child: Column(
                  children: [
                    //brands
                  //  TBrandShowCase(images: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3],),
                    //TBrandShowCase(images: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3],),
                                    //  const SizedBox(height: TSize.spaceBtwItems,),
    
                    //SectionHeading(title: "you might like",showActionButton: true,onPressed: () {},),
                    const SizedBox(height: TSize.spaceBtwItems,),
                    Obx(()=> TGridLayout(itemCount: controller.productCategory.length, itemBuilder: (_,index)=>TProductCardVerticalSort(index: index,product: controller.productCategory,))),
    
                        const SizedBox(height: TSize.spaceBtwSections,),

                  ],
                ),
                ),
      ] 
    );
  }
}