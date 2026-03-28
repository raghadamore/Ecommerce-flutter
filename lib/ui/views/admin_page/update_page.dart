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

class updatePage extends StatelessWidget {
  const updatePage({super.key, required this.index, required this.name});
final int index;
final String name;
  @override
  Widget build(BuildContext context) {
  AdminPageController controller=Get.find<AdminPageController>();
    return Form(
     
      child: Scaffold(
        appBar: TAppBar(showBackArrow: true,title:Text( "Admin Page",style: TextStyle(color: AppColors.primary,fontSize: screenWidth(25)),)),
        body: Obx(
          ()=>Column(
            children: [
              MyTextField(hintText:"name",controller1:controller.updatename ,validator: (p0) {
                if (p0=="") {
                  return "empty value";
                }
              },),
              SizedBox(height: TSize.spaceBtwSections,),
              controller.isloading.value?
              SpinKitCircle(
                color: AppColors.primary,
                
              ):
              MyElevatedButton(onPressed:()=> controller.updateCategory(index ),backgroundColor: AppColors.primary,child: Center(child: Text("save",style: TextStyle(color: AppColors.white),))),
          
            ],
          ),
        ),
      ),
    );
  }
}