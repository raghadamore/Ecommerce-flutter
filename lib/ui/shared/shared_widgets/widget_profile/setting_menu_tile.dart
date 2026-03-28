
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_container/t_circular_image.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({
    super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onTap,
  });
final IconData icon;
final String title,subtitle;
final Widget? trailing;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(icon,size: 28,color: AppColors.primary,) ,
      title:Text(title,style: TextStyle(color: AppColors.black,fontSize: screenWidth(22)),) ,
      subtitle: Text(subtitle,style: TextStyle(color: AppColors.gray,fontSize: screenWidth(28)),) ,
      trailing: trailing,
      onTap: onTap,
    );
  }
}