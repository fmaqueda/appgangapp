import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/products/otherwidgets/row_categories.dart';
import 'package:appgangapp/ui/products/otherwidgets/show_product_gridview.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.ADDPRODUCT);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroudColorThree,
          border: Border.all(
            color: AppColors.colorObscure.withOpacity(0.5),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Obx(() {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                  child: RowCategories(
                      categories: productController.menuCategories),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: (productController
                          .productsListPerCategory.value.isNotEmpty)
                      ? ProductsGridView(
                          productsToShow:
                              productController.productsListPerCategory.value)
                      : ProductsGridView(
                          productsToShow: productController.productsList.value),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
