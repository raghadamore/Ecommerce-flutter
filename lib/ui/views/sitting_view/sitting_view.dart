
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/primary_header_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_profile/setting_menu_tile.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_profile/user_profile_tile.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/address_view/address_view.dart';
import 'package:e_commerce/ui/views/order_view/order_view.dart';
import 'package:e_commerce/ui/views/sitting_view/sitting_controller.dart';

class SittingView extends StatelessWidget {
  const SittingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<SittingViewController>();
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(child:Column(
              children: [
                //appbar
                TAppBar(title: Text("Account",style: TextStyle(color: AppColors.white,fontSize: screenWidth(18)),),),
                //userProfileCard
               const TUserProfileTitle(),
                const SizedBox(height: TSize.spaceBtwSections,)
              ],
            ) ),
            //body
             Padding(padding: EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
               //account setting
               SectionHeading(title: "Account Settings",showActionButton: false,) ,
              const SizedBox(height: TSize.spaceBtwItems,),
              TSettingMenuTile(icon: Icons.home, title: "my addresses", subtitle: "sst shopping delivery address",onTap:()=> Get.to(UserAdressView()),),
              TSettingMenuTile(icon: Icons.shopping_cart, title: "my cart", subtitle: "add, remove products and move to checkout"),
              TSettingMenuTile(icon: Icons.card_giftcard_sharp, title: "my orders", subtitle: "in progress and copmleted orders",onTap: ()=>Get.to(()=>OrderView()),),
              TSettingMenuTile(icon: Icons.discount, title: "my coupon", subtitle: "list of all the discounted coupons"),
              TSettingMenuTile(icon: Icons.notifications, title: "notification", subtitle: "set any kind of notificatin meesage"),
              TSettingMenuTile(icon: Icons.security, title: "account privacy", subtitle: "manage data usage and connected accounts"),


              //app setting
              SizedBox(height: TSize.spaceBtwSections,),
              SectionHeading(title: "App Setting",showActionButton: false,),
              SizedBox(height: TSize.spaceBtwItems,),
              TSettingMenuTile(icon: Icons.location_city, title: "Geolocation", subtitle: "set recomendation based on location",trailing: Switch(value: true, onChanged: (value) {
                
              },),),
              TSettingMenuTile(icon: Icons.image, title: "HD image quality", subtitle: "set image quality to be seen",trailing: Switch(value: false, onChanged: (value) {
                
              },),),


              //loout button
              SizedBox(height: TSize.spaceBtwSections,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: ()=>controller.signOut(), child: const Text("Logout",style: TextStyle(color: AppColors.primary),)),
              ),
               SizedBox(height: TSize.spaceBtwSections*2.5,),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
