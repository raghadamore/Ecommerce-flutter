import 'package:e_commerce/ui/views/verification_view/verification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view.dart';



class SplashController extends GetxController {
  void onInit() {
    splash_delay();
    super.onInit();
  }
  void splash_delay(){
     Future.delayed(Duration(seconds: 2)).then((value) {
    //  Get.off(OnboradingView());
      Get.offAll(SharedPrefrenceRepository().getFirstLunch()
          ? OnboradingView()
          : FirebaseAuth.instance.currentUser!=null
              ? FirebaseAuth.instance.currentUser!.emailVerified?
                NavigationBarMenu():VerificationView()
              :LoginView() );
    });
  }
}
