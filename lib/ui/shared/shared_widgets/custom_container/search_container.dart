import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

import '../../sizes.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.iconsuffix = Icons.mic,
    this.onTap,
    this.padding=const EdgeInsets.symmetric(horizontal:0),
  });
  final String text;
  final IconData? icon;
  final IconData? iconsuffix;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: screenWidth(1),
          padding: const EdgeInsets.all(TSize.md),
          decoration: BoxDecoration(
            color: showBackground ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(TSize.cardRadiusLg),
            border: showBorder
                ? Border.all(
                    color: AppColors.gray,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.graywhite),
              const SizedBox(width: TSize.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Spacer(),
              Icon(iconsuffix, color: AppColors.graywhite),
            ],
          ),
        ),
      ),
    );
  }
}

//search container model