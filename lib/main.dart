import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/ui/views/admin_page/admin_page_controller.dart';
import 'package:e_commerce/ui/views/admin_page/sub_category_controller.dart';
import 'package:e_commerce/ui/views/home/home_controller.dart';
import 'package:e_commerce/ui/views/order_view/order_controller.dart';
import 'package:e_commerce/ui/views/store_view/store_view_controller.dart';
import 'package:e_commerce/ui/views/sub_categories/sub_categories.dart';
import 'package:e_commerce/ui/views/verification_view/verification_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce/core/data/repository/auth_repository.dart';

import 'package:e_commerce/core/services/location_service.dart';

import 'package:e_commerce/ui/shared/network_manager.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/landing_view/landing_view_controller.dart';
import 'package:e_commerce/ui/views/login_view/login_view_controller.dart';
import 'package:e_commerce/ui/views/onboarding_view/onboarding_view_controller.dart';
import 'package:e_commerce/ui/views/signup_view/signup_view_controller.dart';
import 'package:e_commerce/ui/views/sitting_view/sitting_controller.dart';
import 'package:e_commerce/ui/views/splash_view/splash_controller.dart';

import 'app/my_app.dart';
import 'core/data/repository/shared_prefrence_repository.dart';
import 'core/services/connectivity_service.dart';
import 'ui/views/forget_password_view/forget_password_controller.dart';

// late SharedPreferences prefs;
Future main() async {
  // 1. التهيئة الأولية
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. تهيئة Firebase مرة واحدة
  await Firebase.initializeApp(
   
  );
 
  // 3. تهيئة SharedPreferences بشكل متزامن (PutAsync)
  await Get.putAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  // 4. تسجيل الخدمات الأساسية (Services & Repositories) - استخدام Get.put
  Get.put(SharedPrefrenceRepository()); 
  Get.put(ConnectivitySerivce());
  Get.put(LocationService());
  Get.put(Connectivity()); // مكتبة connectivity_plus
  Get.put(NetworkManager());
  Get.put(AuthRepository());
  Get.put(NavigationController());

  // 5. تسجيل المتحكمات (Controllers) - استخدام Get.lazyPut أو Get.create
  // LazyPut: يتم تحميلها عند الحاجة (أفضل للكفاءة)
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => AdminPageController());
  Get.lazyPut(() => SittingViewController());
  Get.lazyPut(() => OnboardingViewController());
  Get.lazyPut(() => LandingViewController());
  Get.lazyPut(() => VerificationController());
  Get.lazyPut(() => ForgetPasswordController());
  Get.lazyPut(() => HomeViewController());
  Get.put( OrderController());
  Get.put( SubCategoryController());
  Get.put( StoreController());
  
  // Get.create: يتم إنشاء نسخة جديدة في كل مرة يتم طلبها (مناسب للواجهات التي يتم إغلاقها وفتحها بكثرة مثل Login/Signup)
  Get.create(() => LoginViewController());
  Get.create(() => SignupViewController());

  // 6. تشغيل التطبيق
  runApp(const MyApp());
}