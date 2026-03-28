
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
     shoeShadow: false,
     showBorder: true,
     backgroundColor: AppColors.white,
     padding: EdgeInsets.only(top: TSize.sm,right: TSize.sm,bottom: TSize.sm,left: TSize.md),
     child: Row(
       children: [
         //textfield
         Flexible(
           child: TextFormField(
             decoration: InputDecoration(
               hintText: "Have a promo code? Enter here",
               hintStyle: TextStyle(fontSize: screenWidth(28)),
               focusedBorder: InputBorder.none,
               border: InputBorder.none,
               enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
             ),
           ),
         ),
         //button
         SizedBox(width: 80,child:
          ElevatedButton(onPressed: (){}, child: Text("Apply"),
          style: ElevatedButton.styleFrom(
           foregroundColor: AppColors.black,
           backgroundColor: AppColors.graywhite,
           side: BorderSide(color: AppColors.gray)
          ),
          ))
       ],
     ),
    );
  }
}