import 'package:appgangapp/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.plus_one,
          size: 20,
        ),
        onPressed: () {
          Get.toNamed(Routes.VIDEOFORM);
        },
      ),
      body: const Center(
        child: Text("Videos"),
      ),
    );
  }
}
