
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/profile_view/profile_view.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(image: TImages.google,width: screenWidth(7),height: screenWidth(7),padding: 0,) ,
      title:Text("Raghad Amore",style: TextStyle(color: AppColors.white,fontSize: screenWidth(22)),) ,
      subtitle: Text("RaghadAmore@gmail.com",style: TextStyle(color: AppColors.white,fontSize: screenWidth(28)),) ,
      trailing: IconButton(onPressed: ()=>Get.to(ProfileView()), icon: const Icon(Icons.edit,color: AppColors.white,)),
    );
  }
}