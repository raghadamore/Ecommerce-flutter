import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/enums/connectivity_status.dart';
import '../ui/shared/utlis.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyAppController extends GetxController {
  @override
  void onInit() {
    checkConnection();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
   authStateChanges(); 
    super.onInit();
    
  }
 void authStateChanges(){
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('====User is currently signed out!');
    } else {
      print('===User is signed in!');
    }
  });
  }



  void checkConnection() async {
    // Connectivity connectivity = Connectivity();
    // ConnectivityResult result = await connectivity.checkConnectivity();
    // connectivitySerivce.connectivityStatusController
    //     .add(connectivitySerivce.getStatus(result));
    // isOnline =
    //     connectivitySerivce.getStatus(result) == ConnectivityStatus.ONLINE;

    ConnectivityStatus status =
        connectivitySerivce.getStatus(await connectivity.checkConnectivity());

    connectivitySerivce.connectivityStatusController.add(status);
    isOnline = status == ConnectivityStatus.ONLINE;

    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline = event == ConnectivityStatus.ONLINE;

      //! if (event == ConnectivityStatus.ONLINE)
      //!   isOnline.value = true;
      //! else
      //!   isOnline.value = false;
    });
  }
}
