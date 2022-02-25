import 'package:appgangapp/ui/auth/bindings/auth_binding.dart';
import 'package:appgangapp/ui/auth/screens/hometab.dart';
import 'package:appgangapp/ui/auth/screens/loading_screen.dart';
import 'package:appgangapp/ui/chat/bindings/message_binding.dart';
import 'package:appgangapp/ui/chat/screens/chat_screen.dart';
import 'package:appgangapp/ui/home/bindings/nav_binding.dart';
import 'package:appgangapp/ui/home/screens/home_screen.dart';
import 'package:appgangapp/ui/products/bindings/product_binding.dart';
import 'package:appgangapp/ui/products/screens/add_product_page.dart';
import 'package:appgangapp/ui/profile/screens/edit_user_page.dart';
import 'package:appgangapp/ui/profile/screens/profile_screen.dart';
import 'package:appgangapp/ui/proof/screens/page2.dart';
import 'package:appgangapp/ui/videos/bindings/video_binding.dart';
import 'package:appgangapp/ui/videos/bindings/video_edit_binding.dart';
import 'package:appgangapp/ui/videos/screens/video_form_screen.dart';
import 'package:appgangapp/ui/videos/screens/videos_home_screen.dart';

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
      VideoBinding(),
      MessageBinding(),
    ]),
    GetPage(
      name: Routes.INTRO,
      page: () => const HomePageTab(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
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
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: Routes.VIDEOS,
      page: () => VideosHomeScreen(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: Routes.VIDEOFORM,
      page: () => VideoForm(),
      binding: VideoEditBinding(),
    ),
  ];
}
