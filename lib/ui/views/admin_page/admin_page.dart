import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_elavated_buttom.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_text_field.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/admin_page/admin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdmainPage extends StatelessWidget {
  const AdmainPage({super.key});

  @override
  Widget build(BuildContext context) {
  AdminPageController controller=Get.find<AdminPageController>();
    return Form(
      key: controller.key,
      child: Scaffold(
        appBar: TAppBar(showBackArrow: true,title:Text( "Admin Page",style: TextStyle(color: AppColors.primary,fontSize: screenWidth(25)),)),
        body: Obx(
          ()=>Column(
            children: [
              MyTextField(hintText: "enter new category name",controller1:controller.name ,validator: (p0) {
                if (p0=="") {
                  return "empty value";
                }
              },),
              ElevatedButton(onPressed:() {
               controller.getImage(); 
              } , child: Text("upload image")),
              SizedBox(height: TSize.spaceBtwSections,),
              controller.isloading.value?
              SpinKitCircle(
                color: AppColors.primary,
                
              ):
              MyElevatedButton(onPressed: controller.addCategory,backgroundColor: AppColors.primary,child: Center(child: Text("add",style: TextStyle(color: AppColors.white),))),
          
            ],
          ),
        ),
      ),
    );
  }
}