import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
     this.showActionButton=true,
    required this.title,
     this.buttontitle="view all",
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttontitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: textColor,
                fontSize: screenWidth(17),
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          showActionButton?
            TextButton(
              onPressed: onPressed,
              child: Text(
                buttontitle,
                style: TextStyle(color: AppColors.graywhite,fontSize: screenWidth(26)),
              ),
            ):SizedBox(),
        ],
      ),
    );
  }
}
