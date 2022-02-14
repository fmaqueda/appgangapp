import 'dart:io';

import 'package:appgangapp/models/user_model.dart';
import 'package:appgangapp/ui/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class GetImagePropio extends GetxController {
  final AuthController authController = Get.find();

  final picker = ImagePicker();

  var urlGetImage = "".obs;

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
        urlGetImage.value = url;
        print(urlGetImage.value);
        /*
        UserModel _updatedUser = UserModel(
            uid: authController.firestoreUser!.value!.uid,
            email: authController.firestoreUser!.value!.email,
            name: authController.firestoreUser!.value!.name,
            photoUrl: url);

        authController.updateUser(context, _updatedUser);
        */
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
}
