import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

import '../../custom _widgets/custom_circular_icon.dart';

class TProductQuantityWithRemoveAndAdd extends StatelessWidget {
  const TProductQuantityWithRemoveAndAdd({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    HomeViewController controller = Get.find<HomeViewController>();
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TCirculeIcon(
            icon: Icons.remove,
            onPressed: () {
              int qlt = controller.cartProduct[index]["qauntity"];
              controller.cartProduct[index]["qauntity"] != 0
                  ? controller.updateQuantityForProductInCart(
                      controller.cartProduct[index].id, qlt - 1)
                  : null;
                  
            },
            width: 32,
            height: 32,
            size: TSize.md,
            color: AppColors.black,
            backgroundColor: AppColors.white,
          ),
          const SizedBox(
            width: TSize.spaceBtwItems,
          ),
          Text(
            controller.cartProduct[index]["qauntity"].toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            width: TSize.spaceBtwItems,
          ),
          TCirculeIcon(
            icon: Icons.add,
            onPressed: () {
              int qlt = controller.cartProduct[index]["qauntity"];
              controller.updateQuantityForProductInCart(
                  controller.cartProduct[index].id, qlt + 1);
            },
            width: 32,
            height: 32,
            size: TSize.md,
            color: AppColors.black,
            backgroundColor: AppColors.blue,
          ),
        ],
      ),
    );
  }
}
