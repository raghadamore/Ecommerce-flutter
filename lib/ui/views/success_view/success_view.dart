import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:flutter/material.dart';



class SuccessView extends StatelessWidget {
  const SuccessView({
    super.key, required this.image, required this.title, required this.subTitle, required this.onPressed,
   
  });
  final String image,title,subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSize.paddingWithAppBarHeight * 2,
            child: Column(
              children: [
                Image(
                    width: screenWidth(0.75),
                    image: AssetImage(image)),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
                Text(
                title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: Text("Continue")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}