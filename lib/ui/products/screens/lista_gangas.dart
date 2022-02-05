import 'package:appgangapp/global_widgets/navigation/custom_navigation_bar.dart';
import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';

import 'package:appgangapp/ui/auth/screens/hometab.dart';
import 'package:appgangapp/ui/home/controllers/nav_controller.dart';
import 'package:appgangapp/ui/profile/screens/profile_screen.dart';
import 'package:appgangapp/ui/products/otherwidgets/product_widget.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/gang_app_icons_icons.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:appgangapp/utils/image_load.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

int indexpage = 0;

class ListGangas extends StatelessWidget {
  ListGangas({Key? key}) : super(key: key);

  //PARA TEST
  final List<Map> myProducts =
      List.generate(50, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    final NavController navController = Get.find();

    return Obx(
      () => Scaffold(
        /*
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: navController.indexpage.value,
          onIndexChanged: (i) {
            navController.indexpage.value = i;
            print(navController.indexpage.value);
          },
        ),
        */
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Listado de Gangas"),
          titleTextStyle: const TextStyle(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        drawer: //Obx(() =>
            Drawer(
          backgroundColor: AppColors.backgroudColorOne,
          child: ListView(
            children: [
              if (authController.firestoreUser!.value != null &&
                  authController.firestoreUser!.value!.photoUrl != null)
                Container(
                  color: const Color(0xFF434343),
                  child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFF434343),
                    ),
                    currentAccountPicture: ImageLoadPerfil().imageGetPhoto(
                        authController.firestoreUser!.value!.photoUrl),
                    accountName: (authController.firestoreUser!.value != null &&
                            authController.firestoreUser!.value!.name != null)
                        ? Text(
                            authController.firestoreUser!.value!.name!,
                            style: textThemePropio.subtitle1!
                                .copyWith(color: AppColors.textColorAlt),
                          )
                        : Text(
                            "Sin Nombre",
                            style: textThemePropio.subtitle1!
                                .copyWith(color: AppColors.textColorAlt),
                          ),
                    accountEmail: (authController.firestoreUser!.value !=
                                null &&
                            authController.firestoreUser!.value!.email != null)
                        ? Text(
                            authController.firestoreUser!.value!.email!,
                            style: textThemePropio.subtitle1!
                                .copyWith(color: AppColors.textColorAlt),
                          )
                        : Text(
                            "Sin Email",
                            style: textThemePropio.subtitle1!
                                .copyWith(color: AppColors.textColorAlt),
                          ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Gangas Estrella",
                          style: textThemePropio.subtitle1!),
                      subtitle: const Text("subtitulo"),
                      trailing: const Icon(
                        GangAppIcons.search_product,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Get.back();
                        /*
                          Get.to(DetailsPage(
                            beer: jsonController.beers[0],
                          ));
                          */
                      },
                    ),
                    ListTile(
                      title: Text("Perfil", style: textThemePropio.subtitle1!),
                      trailing: const Icon(
                        GangAppIcons.user_profile,
                        color: Colors.black,
                      ),
                      onTap: () {
                        if (authController.firestoreUser!.value!.name != null) {
                          authController.nameController.text =
                              authController.firestoreUser!.value!.name!;
                        }
                        Get.back();
                        Get.to(ProfileScreen());
                      },
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      title: Text("Cerrar Sesion",
                          style: textThemePropio.subtitle1!),
                      trailing: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      onTap: () {
                        authController.signOutGoogle();
                        Get.back();
                        Get.to(const HomePageTab());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          // ),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.backgroudColorThree,
            border: Border.all(
              color: AppColors.colorObscure.withOpacity(0.5),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Text("Barra de Categorías"),
                ),
                Flexible(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 4 / 5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ProductWidget(
                            product: myProducts[index]["name"]);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
