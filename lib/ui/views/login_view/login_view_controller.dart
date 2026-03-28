
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';
import 'package:e_commerce/ui/views/verification_view/verification_controller.dart';
import 'package:e_commerce/ui/views/verification_view/verification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/forget_password_view/forget_password_view.dart';
import 'package:e_commerce/ui/views/signup_view/signup_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginViewController extends GetxController{
  
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
RxBool obscureText = true.obs;
GlobalKey<FormState> formKey=GlobalKey();
void toSignup(){
  Get.off(SignupView());
  
}
void toForetPasswordView()async{
  if (emailController.text=="") {
    AwesomeDialog(
      context: Get.context!,
      headerAnimationLoop: false,
      dialogType: DialogType.error,
      title: 'Error',
      desc: "please enter your email pefore enter forget password",
    ).show();
    return;
  } 
  
  try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
   Loader.successSnackBar(Title: "A password reset link has been sent to your email. Please check your inbox to continue");
  } catch (e) {
     AwesomeDialog(
      context: Get.context!,
      headerAnimationLoop: false,
      dialogType: DialogType.error,
      title: 'Error',
      desc: "please ensure your email is entered correctly then retry",
    ).show();
   
  }
  
}


void login() async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );
    saveToken(FirebaseAuth.instance.currentUser!.uid);
    credential.user!.emailVerified?
    // إذا وصلنا إلى هنا، فهذا يعني نجاح المصادقة
    Get.offAll(NavigationBarMenu()): Get.offAll(VerificationView());
    
  } on FirebaseAuthException catch (e) {
    // التقاط أخطاء Firebase المحددة (user-not-found, wrong-password)
    String errorMessage = 'An error occurred. Please try again.';
    
    if (e.code == 'user-not-found') {
      errorMessage = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Wrong password provided for that user.';
    } else if (e.code == 'invalid-email') {
      errorMessage = 'The email address is not valid.';
    }
    
    AwesomeDialog(
      context: Get.context!,
      headerAnimationLoop: false,
      dialogType: DialogType.error,
      title: 'Error',
      desc: errorMessage,
    ).show();

  } catch (e) { // <--- التقاط أي نوع آخر من الاستثناءات (مثل PlatformException)
    print('General error during login: $e');
    AwesomeDialog(
      context: Get.context!,
      headerAnimationLoop: false,
      dialogType: DialogType.error,
      title: 'Connection Error',
      desc: 'Failed to connect to the authentication service. Check your internet or application settings.',
    ).show();
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
    saveToken(FirebaseAuth.instance.currentUser!.uid);

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