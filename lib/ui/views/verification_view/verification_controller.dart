import 'dart:async';

import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    // TODO: implement onInit
    super.onInit();
  }
  sendEmailVerification()async{
  try {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
     Loader.successSnackBar(Title: '',message: "Please Check your inbox and verify your email.");
  } catch (e) {
        Loader.errorSnackBar(Title: 'Oh stop!',message: e.toString());
  }
  }
  void setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (FirebaseAuth.instance.currentUser!=null) {
        await FirebaseAuth.instance.currentUser!.reload(); 
      }
      
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
           timer.cancel();
           Get.off(()=>NavigationBarMenu());
        }
     });
  }
  checkEmailVerification()async{
  final user=FirebaseAuth.instance.currentUser;
         await FirebaseAuth.instance.currentUser!.reload();

   if (FirebaseAuth.instance.currentUser!=null &&FirebaseAuth.instance.currentUser!.emailVerified ) {
      Get.off(()=>NavigationBarMenu());
      print("continue");
   }
   
  
  
    
 }  
}