import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/vertical_image_text.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/sub_categories/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController controller = Get.find<HomeViewController>();
    return Obx(
      () => Container(
        color: AppColors.white,
        height: screenWidth(2.8),
        margin: EdgeInsets.only(top: screenWidth(30), bottom: screenWidth(30)),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return TVerticalImageText(
                backgroundColor: AppColors.graywhite,
                title: controller.data[index]["name"],
                onTap: () =>controller.getproduct(controller.data[index].id,index),
                image: controller.data[index]["image"],
              );
            }),
      ),
    );
  }
}
