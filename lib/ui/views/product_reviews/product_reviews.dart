import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_rating/overall_product_rating.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_rating/rating_bar_indicator.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_rating/rating_progress_indicator.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_rating/user_review_cart.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Reviews & Ratings",style: TextStyle(color: AppColors.black),),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSize.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and reviews are verified and are from people who use the same type of device that you use."),
              SizedBox(
                height: TSize.spaceBtwItems,
              ),
              //overall product ratings
              TOverallProductRating(),
              TRatingBarIndictaor(rating: 3.5,),
              Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(
                height: TSize.spaceBtwSections,
              ),
              //user review list
              const TUserReviewCart(),
              const TUserReviewCart(),
            ],
          ),
        ),
      ),
    );
  }
}
