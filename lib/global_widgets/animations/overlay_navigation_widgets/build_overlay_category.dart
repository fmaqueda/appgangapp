import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/home/controllers/nav_controller.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildOverlayCategory extends StatelessWidget {
  const BuildOverlayCategory(
      {Key? key, required this.routeOverlay, required this.routeText})
      : super(key: key);

  final String routeOverlay;
  final String routeText;

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (routeOverlay == Routes.HOME) {
              navController.indexpage.value = 0;
            }

            Get.back();
            await Get.toNamed(routeOverlay);
          },
          child: Container(
            height: 60,
            color: AppColors.backgroudColorOne,
            child: Center(
              child: Text(
                routeText,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
