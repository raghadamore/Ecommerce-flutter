import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({super.key, this.title,  this.showBackArrow=false, this.leadingIcon, this.actions, this.leadingOnPressed, });
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
   
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () {
               Get.back();
              },
              icon: Icon(Icons.arrow_back_ios ,
                  color:  AppColors.black),
            )
          : leadingIcon!=null?
               IconButton(
                  onPressed: () {
                    leadingOnPressed;
                  },
                  icon: Icon(leadingIcon,color: AppColors.graywhite,),
                )
              : null,
              centerTitle: true,
      title: title,
      actions: actions,
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getAppBarHeight());
}