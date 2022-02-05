import 'dart:io';

import 'package:appgangapp/global_widgets/form_input_field.dart';
import 'package:appgangapp/global_widgets/show_get_dialog.dart';
import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/services/firestore/firestore_service_products.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/utils/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    AuthController authController = Get.find();

    ProductController productController = Get.find();

/*
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
          ProductModel _updatedUser = ProductModel(
              uid: authController.firestoreUser!.value!.uid,
              name: authController.firestoreUser!.value!.email,
              originalprice: 0.0,
              realprice: 0.0,
              imageProductUrl: url);

          authController.updateUser(context, _updatedUser);
        });
      });
    }
*/

    Future _imgFromCamera(BuildContext context) async {
      XFile? image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      //authController.sampleImage.value = image;

      //if (image != null) await _uploadFile(context, File(image.path));
      /*if (authController.firestoreUser!.value != null)
        authController.firestoreUser!.value!.photoUrl = image.path;*/

      //setState(() {});
    }

    Future _imgFromGallery(BuildContext context) async {
      XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      //if (image != null) await _uploadFile(context, File(image.path));
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
      body: Center(
        child: ListView(
          shrinkWrap: true,
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
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidName,
                        labelText: "Nombre Producto",
                        hintText: "Introduce el Nombre del Producto",
                        obscureText: false,
                        controller: productController.nameProduct,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          productController.nameProduct.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidPrice,
                        labelText: "Precio Original Producto",
                        hintText: "Introduce el Precio Original del Producto",
                        obscureText: false,
                        controller: productController.originalPrice,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          productController.originalPrice.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidPrice,
                        labelText: "Precio Real del Producto",
                        hintText: "Introduce el Precio Real del Producto",
                        obscureText: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          )
                        ],
                        controller: productController.realPrice,
                        keyboardType: TextInputType.number,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          productController.realPrice.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidDescription,
                        labelText: "Descripción Producto",
                        hintText: "Introduce la descripción del Producto",
                        obscureText: false,
                        controller: productController.descriptionProduct,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          productController.descriptionProduct.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.backgroudColorOne,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ProductModel _newProduct = ProductModel(
                                uid: "",
                                name: productController.nameProduct.text,
                                originalprice:
                                    productController.originalPrice.text,
                                realprice: productController.realPrice.text,
                                description:
                                    productController.descriptionProduct.text);

                            productController.createProduct(_newProduct);

                            if (true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Tus datos son correctos"),
                                ),
                              );
                              Get.back();
                            }
                          } else {
                            showGetDialog(
                              context,
                              "Atención",
                              "TRellene todos los campos!!",
                            );
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
