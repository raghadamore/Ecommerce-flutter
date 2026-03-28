import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class TSingleAdress extends StatelessWidget {
  const TSingleAdress({super.key, required this.selectedAdress});
final bool selectedAdress;
  @override
  Widget build(BuildContext context) {
    return   TRoundedContainer(
      padding: EdgeInsets.all(TSize.md),
                width: double.infinity,
                showBorder: true,
                shoeShadow: false,
                backgroundColor:selectedAdress?AppColors.blue.withOpacity(0.5):Colors.transparent ,
                borderColor: selectedAdress?Colors.transparent:AppColors.graywhite,
                margin: EdgeInsets.only(bottom: TSize.spaceBtwItems),
                child: Stack(
                  children: [
                    Positioned(
                      right: 5,
                      top: 0,
                      child: Icon(selectedAdress?Icons.check_circle:null,
                      color: selectedAdress?AppColors.black.withOpacity(0.6):null,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("john Doe",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,),
                        SizedBox(height: TSize.sm/2,),
                        const Text("+(122) 456 7890",overflow: TextOverflow.ellipsis,),
                         SizedBox(height: TSize.sm/2,),
                         Text("82356 timmy coves, south liana, maine,us",softWrap: true,)
                      ],
                    )
                  ],
                ),
              );
  }
}