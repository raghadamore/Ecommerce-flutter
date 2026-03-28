import 'package:dartz/dartz.dart';
import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/admin_page/show_category.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SubCategoryController extends GetxController {
    TextEditingController name=TextEditingController();
    TextEditingController updatename=TextEditingController();
    GlobalKey<FormState> key=GlobalKey();
    
    RxBool isloading=false.obs;
 CollectionReference categories = FirebaseFirestore.instance.collection('categories'); 
 RxList<QueryDocumentSnapshot> data=RxList();
@override
void onInit() {
  
  
    // TODO: implement onInit
    super.onInit();
  }
void addCategory() async {
      // Call the user's CollectionReference to add a new user
      try {
          if (key.currentState!.validate()) {
        isloading.value=true;
         await categories
          .add({
            'name': name.text, 
            'id':FirebaseAuth.instance.currentUser!.uid
          })
          .then((value) {
            isloading.value=false;
            Loader.successSnackBar(Title: "added category");
           // getData();
            Get.to(ShowPage());

          } );
    
      }
      else{
        Loader.errorSnackBar(Title: "please enter category then retry");
      }
      } catch (e) {
        isloading.value=false;
              Println("error");
      }
    
      
    }
    
 getData(String id)async{
   QuerySnapshot query= await FirebaseFirestore.instance.collection("categories").doc(id).collection("product").get();
  data.assignAll(query.docs);
 }

 
 deleteCategory(String id,String idproduct)async {
  try {
     await FirebaseFirestore.instance.collection("categories").doc(id).collection("product").doc(idproduct).delete();
    getData(id);
  print("deleted");
  } catch (e) {
    print("error $e");
  }
 
  
 }

 updateCategory(String id,String idproduct,)async {
  try {
    isloading.value=true;
     await FirebaseFirestore.instance.collection("categories").doc(id).collection("product").doc(idproduct).update({
      "name":updatename.text
     });
   //  await FirebaseFirestore.instance.collection("categories").doc(data[index].id).set({
     // "name":updatename.text
     //},SetOptions(merge: true));
     isloading.value=false;
    getData(id);
    Get.back();
  } catch (e) {
    isloading.value=false;
    print("error $e");
  } 
 }
}