import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/order_details/order_details.dart';
import 'package:e_commerce/ui/views/order_view/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:get/get.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller=Get.find<OrderController>();
    return Obx(
      ()=> ListView.separated(
        shrinkWrap: true,
        itemCount: controller.orders.length,
        separatorBuilder: (_,__)=>SizedBox(height: TSize.spaceBtwItems,),
    
      itemBuilder: (_,index)=>  TRoundedContainer(
          shoeShadow: false,
          showBorder: true,
          padding: EdgeInsets.all(TSize.md),
          backgroundColor: controller.getOrderColor(controller.orders[index]["status"]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.orders[index]["status"]=="pending"?
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed:() => controller.cancelOrder(controller.orders[index].id) , icon:Icon(Icons.cancel_presentation,size: screenWidth(20),color: AppColors.red,) )
                
              ],):SizedBox(),
              Row(
                children: [
                 //icon
                 Icon(Icons.date_range_rounded),
                 SizedBox(width: TSize.defaultSpace/2,),
                 //status date
                 Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(controller.orders[index]["status"],style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.blue,fontSizeDelta: 1),),
                      //Text("07 Nov 2024",style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                   ),
                 ),
                 IconButton(onPressed: () {
                   Get.to(OrderDetails(index:index));
                 }, icon:Icon(Icons.arrow_forward_ios,size: TSize.iconSm,) )
                ],
              ),
              SizedBox(height: TSize.spaceBtwItems,),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                       //icon
                       Icon(Icons.shop),
                       SizedBox(width: TSize.defaultSpace/2,),
                       //status date
                       Expanded(
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Order",style: Theme.of(context).textTheme.labelMedium,),
                            Text(controller.orders[index].id,style: Theme.of(context).textTheme.titleMedium,)
                          ],
                         ),
                       ),
                       
                      ],
                    ),
                  ),
                   Expanded(
                child: Row(
                  children: [
                   //icon
                   Icon(Icons.shop),
                   SizedBox(width: TSize.defaultSpace/2,),
                   //status date
                   Expanded(
                     child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium,),
                        Text(controller.formatDate(controller.orders[index]["createdAt"]),style: Theme.of(context).textTheme.titleMedium,)
                      ],
                     ),
                   ),
                   
                  ],
                ),
              ),
                ],
              ),
             
            ],
          ),
        ),
        
      ),
    );
  }
}