
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circular_icon.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical_fav.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/home/home.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WishListView extends StatelessWidget {
  const WishListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Scaffold(
      appBar:TAppBar(
        showBackArrow: true,
        title: Text("wishlist",style:TextStyle(fontSize: screenWidth(18),color: AppColors.gray)),
        actions: [
          TCirculeIcon(icon: Icons.add,onPressed: ()=>Get.to(HomeView()),)
        ],
      ) ,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          children: [
            Obx(()=> TGridLayout(itemCount:controller.favorite.length , itemBuilder: (_,index)=> TProductCardVerticalFav(index: index,)))
          ],
        ),),
      ),
    );

  }
}
