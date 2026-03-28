
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom%20_widgets/custom_circule_container.dart';
import 'package:e_commerce/ui/shared/utlis.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });
final String text;
final bool selected;
final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor=getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:isColor?const SizedBox(): Text(text,style: TextStyle(color: AppColors.black),),
        selected: selected,
        onSelected: onSelected ,
        labelStyle: TextStyle(color:selected? AppColors.black:null),
        disabledColor: Color.fromARGB(255, 193, 190, 190),
        selectedColor: Colors.green,
        
        avatar:isColor?  TCircularContainer(width: 50,height: 50,backgroundColor: getColor(text)!,child:selected? Icon(Icons.check_sharp):null,):
        
        selected?     TCircularContainer(width: 50,height: 50,backgroundColor:AppColors.graywhite,child:selected? Icon(Icons.check_sharp):null,):null,
        shape:isColor? CircleBorder(side: BorderSide(color: AppColors.gray)):null,
        labelPadding:isColor? EdgeInsets.all(0):null,
        padding:isColor?  EdgeInsets.all(0):null,
        
        backgroundColor:isColor?getColor(text): null,
        
      ),
    );
  }
}
