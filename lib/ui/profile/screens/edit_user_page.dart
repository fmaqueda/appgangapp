import 'dart:io';

import 'package:appgangapp/global_widgets/form_input_field.dart';
import 'package:appgangapp/global_widgets/show_get_dialog_2btn.dart';
import 'package:appgangapp/models/user_model.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/utils/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditUser extends StatelessWidget {
  EditUser({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    AuthController authController = Get.find();

    Future _uploadFile(BuildContext context, File imageProfile) async {
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('imageProfile/${authController.firestoreUser!.value!.uid}');

      firebase_storage.UploadTask uploadTask =
          storageReference.putFile(imageProfile);

      print(storageReference);

      await uploadTask.whenComplete(() {
        storageReference.getDownloadURL().then((url) {
          UserModel _updatedUser = UserModel(
              uid: authController.firestoreUser!.value!.uid,
              email: authController.firestoreUser!.value!.email,
              name: authController.firestoreUser!.value!.name,
              photoUrl: url);

          authController.updateUser(context, _updatedUser);
        });
      });
    }

    Future _imgFromCamera(BuildContext context) async {
      XFile? image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      //authController.sampleImage.value = image;

      if (image != null) await _uploadFile(context, File(image.path));
      /*if (authController.firestoreUser!.value != null)
        authController.firestoreUser!.value!.photoUrl = image.path;*/

      //setState(() {});
    }

    Future _imgFromGallery(BuildContext context) async {
      XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (image != null) await _uploadFile(context, File(image.path));
      //setState(() {});
    }

    void _showpicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Desde Libreria"),
                    onTap: () {
                      _imgFromGallery(context);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text("Desde la Cámara"),
                    onTap: () {
                      _imgFromCamera(context);
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Get.back();
          print(authController.firestoreUser!.value!.name);
          print(authController.nameController.text);
          //Exit APP
          /*
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Saliendo de la App! GoodBye!!"),
            ),
          );
          */
          //sleep(const Duration(seconds: 3));
          /*
          await showGetDialog2BTN(
              context, "SALIR DE LA APP", "¿Desea salir de la App?", 1);
*/
          //SystemNavigator.pop();
        },
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20)
                      .add(EdgeInsets.symmetric(horizontal: 40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: AppColors.backgroudColorOne,
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //_imgFromCamera(context);
                    //_imgFromGallery(context);
                    _showpicker(context);
                  },
                  child: Obx(() {
                    return Center(
                      //child: (authController.sampleImage!.value.path == "")
                      child: (authController.firestoreUser!.value == null ||
                              authController.firestoreUser!.value!.photoUrl ==
                                  null)
                          ? Icon(Icons.camera_alt)
                          : CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 75,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child: Image.network(
                                  authController
                                      .firestoreUser!.value!.photoUrl!,
                                  fit: BoxFit.fill,
                                  width: 150,
                                ),
                              ),
                            ),
                    );
                  }),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .add(EdgeInsets.symmetric(horizontal: 20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*
                    FormInputField(
                      validator: FormValidator().isValidEmail,
                      labelText: "Email",
                      hintText: "introduce tu Email",
                      obscureText: false,
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      minLines: 1,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.emailController.text = value!,
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidName,
                        labelText: "Nombre",
                        hintText: "Introduce tu Nombre",
                        obscureText: false,
                        controller: authController.nameController
                          ..text = authController.firestoreUser!.value!.name!,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          authController.nameController.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    /*
                    Obx(
                      () => FormInputField(
                        validator: FormValidator().isValidPassword,
                        labelText: "Password",
                        hintText: "Introduce una Contraseña válida",
                        obscureText: authController.obscureTextPassword.value,
                        controller: authController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        minLines: 1,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.obscureTextPassword.value =
                                !authController.obscureTextPassword.value;
                          },
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) => null,
                        onSaved: (value) =>
                            authController.passwordController.text = value!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => FormInputField(
                        validator: FormValidator().isValidPassword,
                        labelText: "Re-Password",
                        hintText: "Vuelve a introducir tu contraseña",
                        obscureText: authController.obscureTextRePassword.value,
                        controller: authController.repitePasswordController,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.obscureTextRePassword.value =
                                !authController.obscureTextRePassword.value;
                          },
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) => null,
                        onSaved: (value) => authController
                            .repitePasswordController.text = value!,
                      ),
                    ),
                    */
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.backgroudColorOne,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            /*
                            if (authController.passwordController.text !=
                                authController.repitePasswordController.text) {
                              showGetDialog(
                                context,
                                "Alert Password",
                                "Tus passwords no coinciden. Corrígelo!!",
                              );
                            } */

                            UserModel _updatedUser = UserModel(
                                uid: authController.firestoreUser!.value!.uid,
                                email:
                                    authController.firestoreUser!.value!.email,
                                name: authController.nameController.text,
                                photoUrl: authController
                                    .firestoreUser!.value!.photoUrl);

                            authController.updateUser(context, _updatedUser);

                            if (true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Tus datos son correctos"),
                                ),
                              );
                              Get.back();
                            }
                          }
                        },
                        child: const Text("Guardar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
