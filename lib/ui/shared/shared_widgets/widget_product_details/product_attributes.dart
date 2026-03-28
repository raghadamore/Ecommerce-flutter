import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/translation/app_translation.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_product_title_text.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_product_details/choice_chip.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller = Get.find<HomeViewController>();
    return Column(
      children: [
        //selected attribute pricing and description
        TRoundedContainer(
          shoeShadow: false,
          padding: EdgeInsets.all(TSize.md),
          backgroundColor: const Color.fromARGB(255, 184, 189, 189),
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: "Variation",
                    showActionButton: false,
                  ),
                  SizedBox(
                    width: TSize.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Price:",
                            smallSize: true,
                          ),
                          SizedBox(
                            width: TSize.spaceBtwItems,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: TSize.spaceBtwItems,
                          ),
                          ProductTitleText(
                              title: controller.allproduct[index]["price"]
                                  .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Stock",
                            smallSize: true,
                          ),
                          SizedBox(
                            width: TSize.spaceBtwItems,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              ProductTitleText(
                title: controller.allproduct[index]["description"].toString(),
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),

        //attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            SizedBox(
              height: screenWidth(5),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: screenWidth(50),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: controller.allproduct[index]["colors"].length,
               itemBuilder: (context, index1) {
    final currentColor = controller.allproduct[index]["colors"][index1];
    return InkWell(
        onTap: () => controller.selectedProductColor.value = currentColor,
        child: Obx(() => TChoiceChip(
            // هنا نقارن: هل اللون الحالي هو اللون المُختار؟
            selected: controller.selectedProductColor.value == currentColor, 
            text: currentColor,
          
        )),
    );
},
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: "Size",
              showActionButton: false,
            ),
            SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            SizedBox(
              height: screenWidth(5),
              child: ListView.separated(
                separatorBuilder: (context, index) =>  SizedBox(
                        width: screenWidth(50),
                      ),
                scrollDirection: Axis.horizontal,
                itemCount: controller.allproduct[index]["sizes"].length,
                itemBuilder: (context, index1) {
                  return InkWell(
                    onTap: () => controller.selectedProductSize.value= controller.allproduct[index]["sizes"][index1],
                    child: Obx(
                      ()=>TChoiceChip(
                        selected:controller.selectedProductSize.value== controller.allproduct[index]["sizes"][index1], 
                        text: controller.allproduct[index]["sizes"][index1],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
