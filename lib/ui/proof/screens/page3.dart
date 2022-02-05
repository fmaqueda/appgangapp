import 'package:appgangapp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADDPRODUCT),
        child: const Icon(Icons.plus_one),
      ),
      body: Center(
        child: Text("Page 3"),
      ),
    );
  }
}
