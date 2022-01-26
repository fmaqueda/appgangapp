import 'package:appgangapp/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showGetDialog(BuildContext context, String titulo, String content) {
  Widget getContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              content,
              style: const TextStyle(color: AppColors.white),
            ),
          ],
        ));
  }

  Widget confirmBtn() {
    return ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.orangeButton),
        onPressed: () {
          Get.back();
        },
        child: const Text("Confirmar"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"));
  }

  return Get.defaultDialog(
    title: titulo,
    titlePadding: const EdgeInsets.all(20.0),
    titleStyle: Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(color: AppColors.orangeButton),
    backgroundColor: Colors.orange.withOpacity(0.2),
    middleText: "AVISO",
    content: getContent(),
    barrierDismissible: true,
    radius: 10.0,
    confirm: confirmBtn(),
    //cancel: cancelBtn(),
  );
}
