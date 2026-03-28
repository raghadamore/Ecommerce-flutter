import 'package:e_commerce/ui/shared/image_strings.dart';
import 'package:e_commerce/ui/shared/shared_widgets/navigation_bar/navigation_bar_menu.dart';
import 'package:e_commerce/ui/views/signup_view/signup_view_controller.dart';
import 'package:e_commerce/ui/views/sub_categories/sub_categories.dart';
import 'package:e_commerce/ui/views/success_view/success_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeViewController extends GetxController{
 
 static HomeViewController get instance =>Get.find();
 final carousalCurrentIndex=0.obs;
 RxString selectedProductColor=''.obs;
 RxInt quantity=0.obs;
 RxString selectedProductSize=''.obs;
 RxBool isSelectedColor=false.obs;
RxList<QueryDocumentSnapshot> data=RxList();
RxList<QueryDocumentSnapshot> favorite=RxList();
RxList<QueryDocumentSnapshot> product=RxList();
RxList<QueryDocumentSnapshot> allproduct=RxList();
RxList<QueryDocumentSnapshot> cartProduct=RxList();
 @override
 void onInit() {
  getData();
  getAllProducts();
  getProductFromCart();
    // TODO: implement onInit
    super.onInit();
  }
 void updatePageIndector(index){
  carousalCurrentIndex.value=index;
  
 }
 
 getData()async{
  QuerySnapshot query=  await FirebaseFirestore.instance.collection("categories").get();
  data.assignAll(query.docs);
 }

 getproduct(String id,int index)async{
  QuerySnapshot query=  await FirebaseFirestore.instance.collection("categories").doc(id).collection("products").get();
  product.assignAll(query.docs);
  Get.to(()=>SubCategoriesView(ind: index));
 }
 getAllProducts() async {
  QuerySnapshot query = await FirebaseFirestore.instance
      .collectionGroup('products')
      .get();

  allproduct.assignAll(query.docs);
  print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
  print(allproduct);
}

onfavoritePress(int index){
  favorite.contains(allproduct[index])?
  favorite.remove(allproduct[index]):
  favorite.add(allproduct[index]);
}

removefromWishList(int index){
  favorite.removeAt(index);
}

addToCart(QueryDocumentSnapshot product)async{
 String uid=FirebaseAuth.instance.currentUser!.uid;

 print(uid);
 
  await FirebaseFirestore.instance.collection("users").doc(uid).collection("cart").doc(product.id).set({
"name":product["name"],
"price":product["price"],
"brand":product["brand"],
"image":product["image"][0],
"discount":product["discount"],
"qauntity":quantity.value,
"color":selectedProductColor.value,
"size":selectedProductSize.value
  });
  getProductFromCart();
 
}
getProductFromCart()async{
  String uid=FirebaseAuth.instance.currentUser!.uid;
 QuerySnapshot snapshot=  await FirebaseFirestore.instance.collection("users").doc(uid).collection("cart").get();
  cartProduct.assignAll(snapshot.docs);
  
}
updateQuantityForProductInCart(String productId,int quantity)async{
   String uid=FirebaseAuth.instance.currentUser!.uid;
   await FirebaseFirestore.instance.collection("users").doc(uid).collection("cart").doc(productId).update({
    "qauntity":quantity
   });
   DocumentSnapshot doc= await FirebaseFirestore.instance.collection("users").doc(uid).collection("cart").doc(productId).get();
   doc["qauntity"]==0?await FirebaseFirestore.instance.collection("users").doc(uid).collection("cart").doc(productId).delete():null;
   
   getProductFromCart();
}
Future<void> saveOrder(List<QueryDocumentSnapshot> items, double total) async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  // تحويل الـ QueryDocumentSnapshot إلى Map
  List<Map<String, dynamic>> orderItems = items.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return {
      "name": data["name"],
      "price": data["price"],
      "quantity": data["qauntity"],
      "color": data["color"],
      "size": data["size"],
    };
  }).toList();

 DocumentReference order= await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("orders")
      .add({
    "userId": uid,
    "items": orderItems,
    "total": total,
    "status":"pending",
    "createdAt": FieldValue.serverTimestamp(),
  });
await simulateOrderLifeCycle(order.id);

  print("✅ yes ok save order");
for (var doc in items) {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .collection("cart")
      .doc(doc.id)
      .delete();
}


  Get.to(() => SuccessView(
        image: TImages.successPaypal,
        title: 'Payment Success!',
        subTitle: "Your item will be shipped soon",
        onPressed: () => Get.offAll(NavigationBarMenu()),
      ));
}

 simulateOrderLifeCycle(String orderId)async{

  await Future.delayed(const Duration(seconds: 10));
 await updateOrderStatus(orderId, "processing");
  await Future.delayed(const Duration(seconds: 10));
 await updateOrderStatus(orderId, "completed");
}

 updateOrderStatus(String orderId,String status)async{
  String uid=  FirebaseAuth.instance.currentUser!.uid;
  DocumentReference orderRef=  await FirebaseFirestore.instance.collection("users").doc(uid).collection("orders").doc(orderId);
 DocumentSnapshot order=await orderRef.get();
 final data=  order.data() as Map<String,dynamic>;
  data["status"]!="cancelled"? await orderRef.update({
    "status":status
  }):null;
}

}