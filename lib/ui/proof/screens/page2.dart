import 'package:appgangapp/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CHAT);
        },
      ),
      body: const Center(
        child: Text("Pagina 2"),
      ),
    );
  }
}
