import 'package:appgangapp/global_widgets/animations/overlay_animation.dart';
import 'package:appgangapp/global_widgets/navigation/custom_navigation_bar.dart';

import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/chat/screens/rooms_chat_screen.dart';
import 'package:appgangapp/ui/home/controllers/nav_controller.dart';
import 'package:appgangapp/ui/home/screens/product_home_screen.dart';
import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/profile/screens/profile_screen.dart';
import 'package:appgangapp/ui/proof/screens/page1.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    ProductController productController = Get.find();
    var screens = [
      Page1(),
      RoomsChatScreen(),
      ProductHomeScreen(),
      ProfileScreen(),
    ];

    //AuthController authController = AuthController();

    // AuthController authController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: (navController.indexpage.value == 1 ||
                navController.indexpage.value == 2)
            ? null
            : AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Get.to(OverlayAnimation());
                    Navigator.of(context).push(OverlayAnimation());
                  },
                ),
              ),
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: navController.indexpage.value,
          onIndexChanged: (i) {
            navController.indexpage.value = i;

            if (i != 2) {
              productController.productsListPerCategory.value.clear();
            }
          },
        ),
        body: screens[navController.indexpage.value],
      ),
    );
  }
}
