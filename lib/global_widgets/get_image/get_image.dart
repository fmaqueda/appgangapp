import 'dart:io';
import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/models/user_model.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GetImage {
  late String urlGetImage;
  late String pathImage = "";
  final AuthController authController = Get.find();

  final picker = ImagePicker();

  Future uploadFileProduct(
      BuildContext context, File imageProfile, ProductModel newproduct) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProducts/${newproduct.uid}');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

/*
          ProductModel _updatedProduct = ProductModel(
            photoUrl: url,
          );
*/
          newproduct.photoUrl = url;

          //productController.createProduct(newproduct);
        });
      },
    );
  }

  Future uploadFileUser(
      BuildContext context, File imageProfile, UserModel updateUser) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${updateUser.uid}');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

          updateUser.photoUrl = url;

          //authController.updateUser(context, updateUser);
        });
      },
    );
  }

  Future<String> _imgFromGallery(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;
    // await _uploadFile(context, File(image.path));
  }

  Future _imgFromCamera(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;

    // await _uploadFile(context, File(image.path));
  }

  Future showPicker(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Acceder a la galeria"),
                onTap: () async {
                  await _imgFromGallery(context);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Acceder a la cámara"),
                onTap: () async {
                  await _imgFromCamera(context);
                  Get.back();
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
