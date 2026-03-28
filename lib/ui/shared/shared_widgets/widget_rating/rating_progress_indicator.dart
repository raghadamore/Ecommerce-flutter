
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });
final String text;
final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: screenWidth(1.5),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              
              backgroundColor: AppColors.gray,
              valueColor: AlwaysStoppedAnimation(AppColors.blue),
              
            ),
          ),
        )
      ],
    );
  }
}
