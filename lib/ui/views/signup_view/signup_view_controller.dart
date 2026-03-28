import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/views/verification_view/verification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/network_manager.dart';
import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/home/home.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupViewController extends GetxController {
RxString uid="".obs;
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  GlobalKey<FormState> signupFormKey= GlobalKey<FormState>();
void tologin(){
  Get.off(LoginView());
}


Future<void> signup()async{
if (signupFormKey.currentState!.validate()) {
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: usernameController.text,
    password: passwordController.text,
  );
  
  FirebaseFirestore.instance.collection("users").doc(uid.value).set({
    "email":credential.user!.email,
    "createdAt":FieldValue.serverTimestamp(),
  });
  saveToken(FirebaseAuth.instance.currentUser!.uid);

  //FirebaseAuth.instance.currentUser!.sendEmailVerification();
  Get.offAll(VerificationView());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
     AwesomeDialog(
                      context:Get. context!,
                      headerAnimationLoop: false,
                      dialogType: DialogType.error,
                      title: 'Error',
                      desc:
                          'The password provided is too weak.',
                     
                    ).show();
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
     AwesomeDialog(
                      context:Get .context!,
                      headerAnimationLoop: false,
                      dialogType: DialogType.error,
                      title: 'Error',
                      desc:
                          'The account already exists for that email.',
                     autoHide: Duration(seconds: 3),
                    ).show();
  }
} catch (e) {
     Loader.errorSnackBar(Title: 'Oh stop!',message: e.toString());

}


}else{
  print("not valid");
}

}

Future<void> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // إذا فشل المستخدم في تسجيل الدخول
    if (googleUser == null) {
      // إظهار رسالة للمستخدم أنه لم يتم اختيار حساب
      print('لم يتم اختيار حساب Google');
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

    // تحقق من أنه تم الحصول على الـ tokens
    if (googleAuth == null || googleAuth.accessToken == null||  googleAuth.idToken == null) {
      print('فشل في الحصول على تفاصيل المصادقة');
      return;
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    // التوجيه إلى الصفحة التالية بعد تسجيل الدخول
    Get.offAll(() => NavigationBarMenu());
  } catch (e) {
    // إذا حدث خطأ في عملية المصادقة
    print('خطأ أثناء تسجيل الدخول باستخدام Google: $e');
  }
}

Future<void> saveToken(String uid)async{
  String? token= await FirebaseMessaging.instance.getToken();
  await FirebaseFirestore.instance.collection("users").doc(uid).set({
   "FcmToken":token,
  },SetOptions(merge: true));
  print("token saved:$token");
  
}
}