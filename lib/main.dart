import 'package:appgangapp/routes/app_pages.dart';

import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/theme/app_theme.dart';
import 'package:appgangapp/utils/splash_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/*
void main() {
  runApp(const MyApp());
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Get.put<AuthController>(AuthController());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return GetMaterialApp(
            title: 'GangAPP',
            initialRoute: Routes.LOADING,
            theme: appTheme,
            initialBinding: BindingsBuilder(
              () {
                Get.put<AuthController>(AuthController());
              },
            ), //AuthBinding(), //Routes.LOADING
            getPages: AppPages.routes,
          );
        }
      },
    );
/*
    return GetMaterialApp(
        title: 'BEAR NOT BEAR', home: const Intro(), theme: appTheme);
*/
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}
