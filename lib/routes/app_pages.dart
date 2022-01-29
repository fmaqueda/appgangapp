import 'package:appgangapp/auth/screens/hometab.dart';
import 'package:appgangapp/auth/screens/loading_screen.dart';
import 'package:appgangapp/products/screens/list_gangas.dart';
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
    GetPage(
      name: Routes.HOME,
      page: () => ListGangas(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => const HomePageTab(),
    ),
  ];
}
