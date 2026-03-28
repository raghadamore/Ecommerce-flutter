import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
     this.currencySymbol="\$",
    required this.price,
     this.maxLines=1,
     this.islarge=false,
     this.lineThrough=false,
  });
  final String currencySymbol, price;
  final int maxLines;
  final bool islarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(currencySymbol + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: 
             TextStyle(
              fontSize:islarge? screenWidth(24):screenWidth(30),
              fontWeight: FontWeight.bold
            )
    );
  }
}
