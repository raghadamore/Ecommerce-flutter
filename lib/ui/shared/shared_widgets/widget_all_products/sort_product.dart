
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical_sort.dart';
import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

import '../widget_home/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.brand,
  });
final String brand;
  @override
  Widget build(BuildContext context) {
    StoreController controller =Get.find<StoreController>();
    controller.getproduct(brand);
    print("++++++++++++++++++++++++++++");
    print(controller.sortproduct.length);
    print(brand);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Icons.sort)),
          items: [
          "Name","Higher Price" ,"Lower Price",
          ].map((option) =>DropdownMenuItem(child: Text(option),value: option,) ).toList(),
          onChanged: (value) {
            controller.sortProduct(value!, brand);
          },
        ),
        SizedBox(height: TSize.spaceBtwSections,),
         Obx(()=> TGridLayout(itemCount: controller.sortproduct.length, itemBuilder: (_,index)=>TProductCardVerticalSort(index: index,product: controller.sortproduct,)))
      ],
    );
  }
}
