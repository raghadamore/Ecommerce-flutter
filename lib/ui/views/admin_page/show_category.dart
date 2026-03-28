import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_elavated_buttom.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/admin_page/admin_page_controller.dart';
import 'package:e_commerce/ui/views/admin_page/sub_category.dart';
import 'package:e_commerce/ui/views/admin_page/update_page.dart';
import 'package:e_commerce/ui/views/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../shared/shared_widgets/widget_home/vertical_image_text.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdminPageController controller = Get.find<AdminPageController>();
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            "show page",
            style: TextStyle(color: AppColors.primary),
          ),
          showBackArrow: true,
        ),
        body: Column(
            
            children:
            [
              Obx(
              () => Container(
                color: AppColors.white,
                height: screenWidth(2.8),
                margin: EdgeInsets.only(
                    top: screenWidth(30), bottom: screenWidth(30)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return TVerticalImageText(
                        backgroundColor: AppColors.graywhite,
                        title: controller.data[index]["name"],
                        onTap:  () =>Get.to(SubCategory(id:controller.data[index].id)),
                  // AwesomeDialog(context: context,dialogType: DialogType.warning,desc: "what do you do?",btnCancelText: "update",btnOkText: "delete",btnOkOnPress: () {
                  //controller.deleteCategory(index);
                //},
              //  btnCancelOnPress: () {
               
                //  Get.to(updatePage(index: index,name:controller.data[index]["name"],));
               // },).show(),
                        image: TImages.onBoardingImage2,
                      );
                    }),
              ),
            )] ));
  }
}
