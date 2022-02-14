import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCategories extends StatelessWidget {
  final List<String> categories;
  const RowCategories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  productController.productsListPerCategory.value =
                      productController.productsList.value
                          .where((element) =>
                              element.productCategory == categories[index])
                          .toList();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.backgroudColorTwo),
                ),
                child: Text(
                  categories[index],
                  style: textThemePropio.subtitle1!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            return const Text("");
          }
        });
  }
}
