import 'package:get/get.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';

class LandingViewController extends GetxController {
  void ToLoginPage(){
    Get.to(LoginView());
  }
}