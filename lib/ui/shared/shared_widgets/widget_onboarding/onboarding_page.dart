import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });
final String image,title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSize.spaceBtwItems),
      child: Column(
        children: [
            SizedBox(height: screenWidth(2),),
          Image(
            width: screenWidth(1.6),
            height: screenWidth(1.6),
            image: AssetImage(image)),
            Text(title,style: TextStyle(fontSize: screenWidth(22),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          const SizedBox(height: TSize.spaceBtwItems,),
            Text(subTitle,style: TextStyle(fontSize: screenWidth(22)),textAlign: TextAlign.center,),
      
        ],
      ),
    );
  }
}