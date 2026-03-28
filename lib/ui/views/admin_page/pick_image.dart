import 'package:e_commerce/ui/views/admin_page/admin_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pickImage extends StatelessWidget {
  const pickImage({super.key});

  @override
  Widget build(BuildContext context) {
    AdminPageController controller=Get.find<AdminPageController>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextButton(onPressed: () { 
              controller.getImage();
             },
            child: Text("pick image"),),
          ),
        //  Obx(() => controller.file.value!=null?
          //Image.file(controller.file.value!):SizedBox()),
          Obx(() => controller.image.value!=null?Image.network(controller.image.value!):SizedBox()),
          
        ],
      ),
    );
  }
}