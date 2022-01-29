import 'package:appgangapp/controllers/modules/auth/auth_controllers/auth_controller.dart';
import 'package:appgangapp/pages/hometab.dart';
import 'package:appgangapp/theme/color_theme.dart';
import 'package:appgangapp/utils/image_load.dart';
import 'package:appgangapp/utils/product_widget.dart';
import 'package:appgangapp/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListGangas extends StatelessWidget {
  ListGangas({Key? key}) : super(key: key);

  //PARA TEST
  final List<Map> myProducts =
      List.generate(50, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Listado de Gangas"),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Obx(
        () => Drawer(
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
                        ? Text(authController.firestoreUser!.value!.name!)
                        : const Text("Sin Nombre"),
                    accountEmail: (authController.firestoreUser!.value !=
                                null &&
                            authController.firestoreUser!.value!.email != null)
                        ? Text(authController.firestoreUser!.value!.email!)
                        : const Text("Sin Email"),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Gangas Estrella"),
                      subtitle: const Text("subtitulo"),
                      trailing: const Icon(
                        Icons.message,
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
                      title: const Text("Perfil"),
                      trailing: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      onTap: () {
                        if (authController.firestoreUser!.value!.name != null) {
                          authController.nameController.text =
                              authController.firestoreUser!.value!.name!;
                        }
                        Get.back();
                        Get.to(ProfilePageFinal());
                      },
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      title: const Text("Cerrar Sesion"),
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
        ),
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
                      return ProductWidget(product: myProducts[index]["name"]);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
