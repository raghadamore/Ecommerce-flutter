import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<QueryDocumentSnapshot> orders=RxList();
  @override
  void onInit() {
    getOrders();
    // TODO: implement onInit
    super.onInit();
  }
  getOrders()async{
    String uid=await FirebaseAuth.instance.currentUser!.uid;
     await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("orders").snapshots().listen((event) {
        orders.assignAll(event.docs);
      });
    
    print("00000000000000000000000000000000000000000000000000000000000000000000000");
    print(orders);
  }
 Color getOrderColor(String status){
  switch (status) {
    case "pending":
      return AppColors.orange;
      break;
    case "processing":
      return AppColors.blue;
      break;
      
    case "completed":
      return AppColors.green;
      break;
    case "cancelled":
      return AppColors.red;
      break;
        
    default:
        return AppColors.gray;
      break;
  }
 }
  String formatDate(Timestamp? timestamp) {
    if (timestamp == null) return "";
    final date = timestamp.toDate();
    return "${date.day}/${date.month}/${date.year}";
  }
  cancelOrder(String orderId)async{
   String uid=  FirebaseAuth.instance.currentUser!.uid;
  DocumentReference orderRef=  await FirebaseFirestore.instance.collection("users").doc(uid).collection("orders").doc(orderId);
 DocumentSnapshot order=await orderRef.get();
 final data=  order.data() as Map<String,dynamic>;
  await orderRef.update({
    "status":"cancelled"
  });
  }
}