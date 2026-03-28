import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';

import 'package:e_commerce/ui/shared/shared_widgets/widget_order/order_list_item.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  TAppBar(
        title: Text(
          "My Order",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(padding: EdgeInsets.all(TSize.defaultSpace,),child: TOrderListItem(),),
    );
  }
}