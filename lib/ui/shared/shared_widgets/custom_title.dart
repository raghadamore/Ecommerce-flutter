
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key, required this.text1, required this.text2,
  });
final String text1;
final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:  screenWidth(9),bottom: screenWidth(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1,style: TextStyle(fontSize: screenWidth(10),fontWeight: FontWeight.bold),),
          Text(text2,style: TextStyle(fontSize: screenWidth(10),fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}