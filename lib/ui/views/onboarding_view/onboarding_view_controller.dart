import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';


class OnboardingViewController extends GetxController {
  
final pagecontroller=PageController();
Rx<int> currentPageIndex=0.obs;

@override
void onInit() {
  storage.setFirstLunch(false);
    // TODO: implement onInit
    super.onInit();
  }

  void updatePageIndictor(index)=>currentPageIndex.value=index;
  void dotNavigationClick(index){
    currentPageIndex.value=index;
    pagecontroller.jumpTo(index);
  }
  void nextPage(){
     if (currentPageIndex.value==2) {
       Get.to(LoginView());
     }else{
      int page=currentPageIndex.value+1;
      pagecontroller.jumpToPage(page);
     }
  }
  void prevPage(){
    
      int page=currentPageIndex.value-1;
      pagecontroller.jumpToPage(page);
     
  }
  void skipPage() {
currentPageIndex.value=2;
pagecontroller.jumpToPage(2);
  }
   
  
  
}