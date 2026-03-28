import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_all_products/sort_product.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text("Popular Product",style: TextStyle(color: AppColors.black),), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
        //  child: TSortableProducts(),
        ),
      ),
    );
  }
}
