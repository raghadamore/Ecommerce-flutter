import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class AddToCartContainer extends StatelessWidget {
  const AddToCartContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusMd),
          bottomRight: Radius.circular(TSize.productImageRadius),
        ),
      ),
      child: SizedBox(
        width: TSize.iconLg * 1.2,
        height: TSize.iconLg * 1.2,
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}