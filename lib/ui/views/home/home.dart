import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_card_counter.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/search_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/home_categories.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/product_card_vertical.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/promo_slider.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/all_product/all_product_view.dart';
import 'package:e_commerce/ui/views/cart_view/cart_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController controller=Get.find<HomeViewController>();
    return Scaffold(
      appBar: TAppBar(
        leadingIcon: Icons.menu,
        showBackArrow: false,
        title: Image.asset(
          TImages.logo,
          height: screenWidth(11),
        ),
        actions: [
          TCardCounterIcon(
            onPressed: ()=>Get.to(CartView()),
            iconColor: AppColors.graywhite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: TSize.spaceBtwItems),
              SearchContainer(
                text: "Search any Product...",
                showBorder: false,
                onTap: () {},
              ),
              const SizedBox(height: TSize.sm),
              SectionHeading(
                  showActionButton: true,
                  title: "All Featured",
                 onPressed: ()=>Get.to(()=>AllProductView()),),
              const SizedBox(height: TSize.sm),
              THomeCategories(),
              Column(
                children: [
                const  TPromoSlider(banners: [TImages.promoBanner1,TImages.promoBanner2,TImages.promoBanner3],),
                 const SizedBox(height: TSize.spaceBtwSections,),
                  TGridLayout(itemCount: controller.allproduct.length,itemBuilder:  (_, index) =>  TProductCardVertical(index: index,),),
                   
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

