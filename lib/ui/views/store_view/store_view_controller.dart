import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
RxList<QueryDocumentSnapshot> brands=RxList();
RxList<QueryDocumentSnapshot> sortproduct=RxList();
RxList<QueryDocumentSnapshot> productCategory=RxList();
  RxInt currentTabIndex = 0.obs;
RxMap<String,int> numProduct=RxMap();
  @override
  void onInit() {
    getBrands();
    getNumOfProduct();
   
    // TODO: implement onInit
    super.onInit();
  }
  getBrands() async {
  QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("brands").get();
   brands.assignAll(snapshot.docs);
  }
  getNumOfProduct() async {
    numProduct.clear();
  QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").get();
  snapshot.docs.forEach((element) {
    String brand=element["brand"];
   numProduct.containsKey(brand)?numProduct[brand]=numProduct[brand]!+1:numProduct[brand]=1;
  });
  }
  sortProduct(String value,String brand) async {
 
  switch (value) {
    case "Name":
    sortproduct.clear();
   QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("brand",isEqualTo:brand ).orderBy("name",descending: false).get();
    sortproduct.value=snapshot.docs;
      break;
    case "Higher Price" :  
    sortproduct.clear();
    
      QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("brand",isEqualTo:brand ).orderBy("price",descending: true).get();
    sortproduct.value=snapshot.docs;
    
    print(sortproduct);
       break;
    case "Lower Price" : 
    sortproduct.clear();
     QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("brand",isEqualTo:brand ).orderBy("price",descending: false).get();
    sortproduct.value=snapshot.docs;
    break;
     
    default:
      QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("brand",isEqualTo:brand ).get();
    sortproduct.value=snapshot.docs;
  }
  }
  getproduct(String brand) async {
   
     QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("brand",isEqualTo:brand ).get();
    sortproduct.value=snapshot.docs;
    print("ggggggggggggggggggggggggggggg");
    print(sortproduct.length);
    print(brand);
  }

 void changeTab(int index) {
    currentTabIndex.value = index;
    switch (index) {
      case 0:
        getproductByCategoryName("beauty");
        break;
      case 1:
        getproductByCategoryName("accessories");
        break;
      case 2:
        getproductByCategoryName("shoes");
        break;
      case 3:
        getproductByCategoryName("clothes");
        break;
    }
  }

  getproductByCategoryName(String categoryName) async {
    productCategory.clear();
    QuerySnapshot snapshot= await FirebaseFirestore.instance.collectionGroup("products").where("category",isEqualTo: categoryName).get();
    productCategory.assignAll(snapshot.docs);
    print("ffffffffffffffffffffffffffffff");
    print(productCategory);
  }


}