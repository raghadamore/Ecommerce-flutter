import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/ui/shared/shared_widgets/loader.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/admin_page/admin_page.dart';
import 'package:e_commerce/ui/views/admin_page/show_category.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
class AdminPageController extends GetxController {
    TextEditingController name=TextEditingController();
    TextEditingController updatename=TextEditingController();
    GlobalKey<FormState> key=GlobalKey();
    
    RxBool isloading=false.obs;
 CollectionReference categories = FirebaseFirestore.instance.collection('categories'); 
 RxList<QueryDocumentSnapshot> data=RxList();
var file=Rxn<File>();
RxnString image=RxnString();
@override
void onInit() {
  getData();
  getToken();
  myRequestPermission();
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
            'image':image.value??"https://th.bing.com/th/id/R.ac9f3c55bcbd06517741ec04222fce05?rik=1t08dqI2V99HYQ&pid=ImgRaw&r=0",
            //'id':FirebaseAuth.instance.currentUser!.uid
          })
          .then((value) {
            isloading.value=false;
            Loader.successSnackBar(Title: "added category");
            getData();
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
    
 getData()async{
  QuerySnapshot query=  await FirebaseFirestore.instance.collection("categories").where("id",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
  data.assignAll(query.docs);
 }

 
 deleteCategory(int index)async {
  try {
     await FirebaseFirestore.instance.collection("categories").doc(data[index].id).delete();
    getData();
  print("deleted");
  } catch (e) {
    print("error $e");
  }
 
  
 }

 updateCategory(int index)async {
  try {
    isloading.value=true;
     await FirebaseFirestore.instance.collection("categories").doc(data[index].id).update({
      "name":updatename.text
     });
   //  await FirebaseFirestore.instance.collection("categories").doc(data[index].id).set({
     // "name":updatename.text
     //},SetOptions(merge: true));
     isloading.value=false;
    getData();
    Get.back();
  } catch (e) {
    isloading.value=false;
    print("error $e");
  } 
 }
 //يستخدم للتأكد من أننا نقرأ ونكتب على اخر نسخة من القيم الموجودة في السيرفر

 void transaction(int index){
 DocumentReference documentReference= FirebaseFirestore.instance.collection("category").doc(data[index].id);

 FirebaseFirestore.instance.runTransaction((transaction) async{
 DocumentSnapshot  snapshot=await transaction.get(documentReference);

 if (snapshot.exists) {
   var snapshotData=snapshot.data();
   if (snapshotData is Map<String,dynamic>) {
     int money=snapshotData["money"]+100;
     transaction.update(documentReference, {"money":money});
   }
 }
 }
  
 ).then((value) => Get.off(AdmainPage()));
 } 
 //طريقه تمكننا من تنفيذ عدة عمليات كتابة بنفس الوقت
 //هي خليط من set update delete بنفس الوقت
 
 void batch(){
  CollectionReference category=FirebaseFirestore.instance.collection("category");
  DocumentReference doc1=FirebaseFirestore.instance.collection("category").doc("1");
  DocumentReference doc2=FirebaseFirestore.instance.collection("category").doc("2");
   
   WriteBatch batch= FirebaseFirestore.instance.batch();

   batch.delete(doc1);
   batch.set(doc2, {
    "username":"ahmad",
    "money":23
   });
   //أما تتم معا او لا تتم
   batch.commit();

 }
 
 getImage()async{
  final ImagePicker picker = ImagePicker();

final XFile? imageCallery = await picker.pickImage(source: ImageSource.gallery);

//final XFile? imageCamera = await picker.pickImage(source: ImageSource.camera);
if (imageCallery!=null) {
  file.value=File(imageCallery.path);
 String name= basename(imageCallery.path);
//إنشاء تخزين لرفع الصور والملفات
 Reference refimage= FirebaseStorage.instance.ref("images/${name}");
// Reference refimage= FirebaseStorage.instance.ref("images").child(name);
 //رفع الصورة
 await refimage.putFile(file.value!);
  //جلب رابط الصورة بعد الرفع
   image.value=await refimage.getDownloadURL();
}
 }



 // firebase notification
getToken()async{
 String? mytoken= await FirebaseMessaging.instance.getToken();
 print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
 print(mytoken);
}
myRequestPermission()async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  print('User granted permission');
} else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  print('User granted provisional permission');
} else {
  print('User declined or has not accepted permission');
}
}
}