import 'package:appgangapp/ui/auth/bindings/auth_binding.dart';
import 'package:appgangapp/ui/auth/screens/hometab.dart';
import 'package:appgangapp/ui/auth/screens/loading_screen.dart';
import 'package:appgangapp/ui/home/bindings/nav_binding.dart';
import 'package:appgangapp/ui/home/screens/home_screen.dart';
import 'package:appgangapp/ui/products/bindings/product_binding.dart';
import 'package:appgangapp/ui/products/screens/add_product_page.dart';
import 'package:appgangapp/ui/profile/screens/edit_user_page.dart';

import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL_LOGGED = Routes.HOME;
  static const INITIAL_NOT_LOGGED = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.LOADING,
      page: () => const LoadingScreen(),
    ),
    GetPage(name: Routes.HOME, page: () => const HomeScreen(), bindings: [
      NavBinding(),
      ProductBinding(),
    ]),
    GetPage(
      name: Routes.INTRO,
      page: () => const HomePageTab(),
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => EditUser(),
    ),
    GetPage(
      name: Routes.ADDPRODUCT,
      page: () => AddProduct(),
      binding: ProductBinding(),
    ),
  ];
}
