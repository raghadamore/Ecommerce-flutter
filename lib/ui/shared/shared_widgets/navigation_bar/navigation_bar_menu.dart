import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/utlis.dart';
import 'package:e_commerce/ui/views/home/home.dart';
import 'package:e_commerce/ui/views/sitting_view/sitting_view.dart';
import 'package:e_commerce/ui/views/store_view/store_view.dart';
import 'package:e_commerce/ui/views/wishlist_view/wishlist_view.dart';

class NavigationBarMenu extends StatelessWidget {
  const NavigationBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<NavigationController>();
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: screenWidth(6),
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>controller.selectedIndex.value=index ,
      
          destinations: const[
          NavigationDestination(icon:Icon(Icons.home) , label: 'home'),
          NavigationDestination(icon:Icon(Icons.shop) , label: 'store'),
          NavigationDestination(icon:Icon(Icons.favorite) , label: 'wishlist'),
          NavigationDestination(icon:Icon(Icons.person) , label: 'profile'),
        ],),
      ),
      body:Obx(() => controller.screens[controller.selectedIndex.value]) ,
    );
  }
}
class NavigationController extends GetxController {
  final Rx<int> selectedIndex=0.obs;
  final screens=[const HomeView(),const StoreView(),const WishListView(),const SittingView()];
}


