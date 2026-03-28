import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key, required this.itemCount, this.mainAxisEtend=288, required this.itemBuilder,
  });
final int itemCount;
final double? mainAxisEtend;
final Widget? Function(BuildContext,int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisEtend,
          mainAxisSpacing: TSize.gridViewSpacing,
          crossAxisSpacing: TSize.gridViewSpacing),
      itemBuilder:itemBuilder,
    );
  }
}
