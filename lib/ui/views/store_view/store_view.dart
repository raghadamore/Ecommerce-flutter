import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_card_counter.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/search_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/tab_bar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/grid_layout.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/category_tab.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_store/t_brand_card.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/views/all_brands/all_brands_view.dart';

class StoreView extends StatelessWidget {
  const StoreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StoreController controller =Get.find<StoreController>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "shop",
            style: TextStyle(color: AppColors.black),
          ),
          actions: [
            TCardCounterIcon(
              onPressed: () {},
              iconColor: AppColors.graywhite,
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: AppColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(TSize.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //search bar
                        SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                        SearchContainer(
                          text: "Search in store",
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                        //feature brands
                        SectionHeading(
                            title: "Feature Breands", onPressed: () =>Get.to(()=>AllBrandView()),showActionButton: true),
                        const SizedBox(
                          height: TSize.spaceBtwItems / 1.5,
                        ),
    
                        TGridLayout(
                            itemCount:4,
                            mainAxisEtend: 88,
                            itemBuilder: (_, index) {
                              return  TBrandCard(showBorder: true,index: index,);
                            })
                      ],
                    ),
                  ),
                  bottom: TTabBar(
                    ontap: (index) =>controller.changeTab(index) ,
                    tabs:  [
          Tab(child: Text("beauty"),),
          Tab(child: Text("accessories"),),
          Tab(child: Text("shoes"),),
          Tab(child: Text("clothes"),),
          
        ]),
                )
              ];
            },
            body: TabBarView(
              
              children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              
            ],)),
      ),
    );
  }
}
