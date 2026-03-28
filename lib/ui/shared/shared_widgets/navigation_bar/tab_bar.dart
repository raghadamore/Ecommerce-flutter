
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key, required this.tabs, this.ontap,
  });
final List<Widget> tabs;
final Function(int)? ontap;
  @override
  Widget build(BuildContext context) {
    return  TabBar(
      onTap: ontap,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        unselectedLabelColor: AppColors.gray,
        labelColor: AppColors.primary,
        tabs:tabs);
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(getAppBarHeight());
}
