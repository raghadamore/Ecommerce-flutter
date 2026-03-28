import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_home/section_heading.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_profile/profile_menu.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: AppColors.gray, fontSize: screenWidth(18)),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      image: TImages.google,
                      width: screenWidth(6),
                      height: screenWidth(6),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Change Profile Picture",
                          style: TextStyle(color: AppColors.graywhite),
                        )),
                  ],
                ),
              ),
              //details
              const SizedBox(height: TSize.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems,),
              SectionHeading(title: "Profile Information",showActionButton: false,),
              const SizedBox(height: TSize.spaceBtwItems,),

              TProfileMenu(title: 'Name', value: 'coding with t', onPressed: () {  },),
              TProfileMenu(title: 'UserName', value: 'coding with t', onPressed: () {  },),
              
              const SizedBox(height: TSize.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems,),

              //heading personal info
               SectionHeading(title: "personal Information",showActionButton: false,),
              const SizedBox(height: TSize.spaceBtwItems,),

              TProfileMenu(title: 'User ID', value: '453256', onPressed: () {  },),
              TProfileMenu(title: 'E-mail', value: 'coding with t', onPressed: () {  },),
              TProfileMenu(title: 'Phone Number', value: '+963 99784524', onPressed: () {  },),
              TProfileMenu(title: 'Gender', value: 'male', onPressed: () {  },),
              TProfileMenu(title: 'Date of Birth', value: '10 oct,1999', onPressed: () {  },),

              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems,),

              Center(
                child: TextButton(onPressed: () {
                  
                }, child: const Text("Close Account",style: TextStyle(color: AppColors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
