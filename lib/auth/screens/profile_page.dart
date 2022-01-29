import 'package:appgangapp/auth/controllers/auth_controller.dart';
import 'package:appgangapp/auth/screens/hometab.dart';
import 'package:appgangapp/theme/color_theme.dart';
import 'package:appgangapp/theme/text_theme.dart';
import 'package:appgangapp/utils/image_load.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageFinal extends StatelessWidget {
  ProfilePageFinal({Key? key}) : super(key: key);

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                color: AppColors.orange,
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
                        AppColors.orangeButton),
                  ),
                  onPressed: () async {
                    //Get.to(EditUser());
                  },
                  child: const Text("Editar"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Obx(
          () => Column(
            children: [
              Center(
                child: Container(
                  child: ImageLoadPerfil().imageGetPhoto(
                      authController.firestoreUser!.value!.photoUrl,
                      radius: 80.0),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    (authController.firestoreUser!.value != null &&
                            authController.firestoreUser!.value!.name != null)
                        ? authController.firestoreUser!.value!.name!
                        : "Usuario Anonimo",
                    style: textTheme.headline6,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    (authController.firestoreUser!.value != null &&
                            authController.firestoreUser!.value!.email != null)
                        ? authController.firestoreUser!.value!.email!
                        : "Email no configurado",
                    style: textTheme.headline5,
                  ),
                ),
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
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFB449))),
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
        ),
      ],
    ));
  }
}
