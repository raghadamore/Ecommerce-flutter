
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e_commerce/ui/shared/colors.dart';

class TRatingBarIndictaor extends StatelessWidget {
  const TRatingBarIndictaor({
    super.key, required this.rating,
  });
final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 17,
        unratedColor: AppColors.graywhite,
        itemBuilder: (_, __) => Icon(
              Icons.star,
              color: AppColors.blue,
            ));
  }
}
