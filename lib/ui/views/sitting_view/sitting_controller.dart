import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SittingViewController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> signOut()async{
    GoogleSignIn googleSignIn=GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Get.offAll(LoginView());
  }
}