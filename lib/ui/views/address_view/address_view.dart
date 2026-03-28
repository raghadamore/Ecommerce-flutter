import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_rounded_container.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_addresses/single_address.dart';
import 'package:e_commerce/ui/shared/sizes.dart';
import 'package:e_commerce/ui/views/address_view/add_new_address.dart';

class UserAdressView extends StatelessWidget {
  const UserAdressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=> AddNewAddressView()),
      child: Icon(Icons.add,color: AppColors.white,),
      backgroundColor: AppColors.blue,
      ),
        appBar: TAppBar(
          showBackArrow: true,
          title: Text("Addresses",style: Theme.of(context).textTheme.headlineSmall,),
          
        ),
        body: SingleChildScrollView(
          child: Padding(padding: 
          EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
            TSingleAdress(selectedAdress: false,),
            TSingleAdress(selectedAdress: true,)
            ],
          ),
          ),
        ),

    );
  }
}