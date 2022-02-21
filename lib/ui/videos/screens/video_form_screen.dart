import 'dart:io';

import 'package:appgangapp/global_widgets/form_input_field.dart';
import 'package:appgangapp/global_widgets/get_image/get_image.dart';
import 'package:appgangapp/global_widgets/show_get_dialog.dart';
import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/videos/controllers/video_edit_controller.dart';
import 'package:appgangapp/utils/form_validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VideoForm extends StatelessWidget {
  VideoForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final GetImage getImage = GetImage();

  @override
  Widget build(BuildContext context) {
    VideoEditController videoEditController = Get.find();

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20)
                      .add(const EdgeInsets.symmetric(horizontal: 40)),
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
                Obx(() {
                  return GestureDetector(
                    onTap: () async {
                      await getImage.showPicker(context);
                      videoEditController.pathImageProduct.value =
                          getImage.pathImage;
                    },
                    child: Center(
                      child: (videoEditController.pathImageProduct.value == "")
                          ? const Icon(Icons.camera_alt)
                          : CircleAvatar(
                              foregroundColor: Colors.black,
                              radius: 75,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child: Image.file(
                                  File(
                                    videoEditController.pathImageProduct.value,
                                  ),
                                  fit: BoxFit.fill,
                                  width: 150,
                                ),
                              ),
                            ),
                    ),
                  );
                }),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .add(const EdgeInsets.symmetric(horizontal: 20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidName,
                        labelText: "Nombre Video",
                        hintText: "Introduce el Nombre del Video",
                        obscureText: false,
                        controller: videoEditController.nameController,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          videoEditController.nameController.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidName,
                        labelText: "Subtitulo del Video",
                        hintText: "Introduce el Subtitulo del Video",
                        obscureText: false,
                        controller: videoEditController.subtitleController,
                        keyboardType: TextInputType.name,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          videoEditController.subtitleController.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    FormInputField(
                        validator: FormValidator().isValidURL,
                        labelText: "Url Video",
                        hintText: "Introduce la url del Video",
                        obscureText: false,
                        controller: videoEditController.urlVidController,
                        keyboardType: TextInputType.url,
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (value) => null,
                        onSaved: (value) {
                          videoEditController.urlVidController.text = value!;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.backgroudColorOne,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String _videoUID =
                                videoEditController.genProductUID();
                            VideoModel _newVideo = VideoModel(
                              id: _videoUID,
                              name: videoEditController.nameController.text,
                              subtitle:
                                  videoEditController.subtitleController.text,
                              urlImage: "",
                              urlVid: videoEditController.urlVidController.text,
                            );

                            if (videoEditController.pathImageProduct.value !=
                                "") {
                              await getImage.uploadFileVideoImage(
                                  context,
                                  File(videoEditController
                                      .pathImageProduct.value),
                                  _newVideo);

                              videoEditController.saveNewVideo(_newVideo);

                              if (true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Video guardado"),
                                  ),
                                );
                                Get.back();
                              }
                            } else {
                              showGetDialog(
                                context,
                                "Atención",
                                "Falta la imagen. Es necesario cargar una imagen del video",
                              );
                            }
                          } else {
                            showGetDialog(
                              context,
                              "Atención",
                              "Rellene todos los campos!!",
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
