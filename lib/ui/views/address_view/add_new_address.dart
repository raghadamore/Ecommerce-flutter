import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/shared_widgets/custom_appbar.dart';
import 'package:e_commerce/ui/shared/shared_widgets/widget_addresses/text_form-field.dart';
import 'package:e_commerce/ui/shared/sizes.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text("Add New Address"),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultSpace),
        child: Form(

          child: Column(
            children: [
             TextFormFiledAdress(icon: Icons.person, labelText: "Name"),
              const SizedBox(height: TSize.spaceBtwInputFields,),
             TextFormFiledAdress(icon: Icons.mobile_friendly_sharp, labelText: "Phone Number"),
              const SizedBox(height: TSize.spaceBtwInputFields,),
              Row(
                children: [
              Expanded(child: TextFormFiledAdress(icon: Icons.build, labelText: "Street")),
               const SizedBox(width: TSize.defaultSpace,),
             Expanded(child: TextFormFiledAdress(icon: Icons.code, labelText: "Postal Code")),
                ],
              ),
               const SizedBox(height: TSize.spaceBtwInputFields,),
                  Row(
                children: [
              Expanded(child: TextFormFiledAdress(icon: Icons.build, labelText: "City")),
               const SizedBox(width: TSize.defaultSpace,),
             Expanded(child: TextFormFiledAdress(icon: Icons.local_activity, labelText: "State")),
                ],
              ),
                 const SizedBox(height: TSize.spaceBtwInputFields,),
                  TextFormFiledAdress(icon: Icons.golf_course_outlined, labelText: "Country"),
                 const SizedBox(height: TSize.defaultSpace,),
                 SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {
                   
                 }, child: Text("Save")),)

            ],
          ),
        ),
        ),
      ),
    );
  }
}