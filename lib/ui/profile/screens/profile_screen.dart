import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/auth/screens/hometab.dart';
import 'package:appgangapp/ui/profile/screens/edit_user_page.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:appgangapp/utils/image_load.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
        Padding(
          padding: EdgeInsets.only(top: 50)
              .add(EdgeInsets.symmetric(horizontal: 40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                width: 40,
                color: AppColors.backgroudColorOne,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(child: Text(" ")),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.backgroudColorOne),
                  ),
                  onPressed: () async {
                    Get.to(EditUser());
                  },
                  child: const Text("Editar"),
                ),
              ),
            ],
          ),
        ),
        */
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Obx(
                () => Center(
                  child: Container(
                    child: ImageLoadPerfil().imageGetPhoto(
                        authController.firestoreUser!.value?.photoUrl,
                        radius: 80.0),
                  ),
                ),
              ),
              Obx(
                () => Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      (authController.firestoreUser!.value != null &&
                              authController.firestoreUser!.value!.name != null)
                          ? authController.firestoreUser!.value!.name!
                          : "Usuario Anonimo",
                      style: textThemePropio.headline6,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      (authController.firestoreUser!.value != null &&
                              authController.firestoreUser!.value!.email !=
                                  null)
                          ? authController.firestoreUser!.value!.email!
                          : "Email no configurado",
                      style: textThemePropio.headline5,
                    ),
                  ),
                ),
              ),
              (authController.firestoreUser!.value != null &&
                      authController.firestoreUser!.value!.name != null)
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 40),
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.backgroudColorOne),
                          ),
                          child: const Text(
                            "EDITAR",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.EDITPROFILE);
                          },
                        ),
                      ),
                    )
                  : const Center(
                      child: Text(""),
                    ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.backgroudColorOne),
                    ),
                    child: const Text(
                      "CERRAR SESION",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(const HomePageTab());
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
