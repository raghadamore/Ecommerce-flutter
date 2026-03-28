import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';

class NetworkManager extends GetxController {
  final Connectivity _connectivity=Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _commectivityStatus= ConnectivityResult.none.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _connectivitySubscription=_connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  Future<void> _updateConnectionStatus(ConnectivityResult result)async{
    _commectivityStatus.value=result;
    if ( _commectivityStatus.value==ConnectivityResult.none) {
      Loader.warningSnackBar(Title: "No Internet Connection");
    }
  }
  Future<bool> isConnected()async {
    try {
      final result= await _connectivity.checkConnectivity();
      if (result==ConnectivityResult.none) {
        return false;
      }else{
        return true;
      }
    }on PlatformException catch (_) {
      return false;
    }
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}