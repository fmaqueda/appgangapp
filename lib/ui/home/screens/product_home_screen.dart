import 'package:appgangapp/routes/app_pages.dart';
import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:appgangapp/ui/products/otherwidgets/build_actions_search.dart';
import 'package:appgangapp/ui/products/otherwidgets/row_categories.dart';
import 'package:appgangapp/ui/products/otherwidgets/show_product_gridview.dart';
import 'package:appgangapp/ui/products/otherwidgets/text_search_field.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroudColorFour,
          leading: productController.isSearching.value
              ? const BackButton()
              : Container(),
          title: productController.isSearching.value
              ? const TextSearchField()
              : const Text("Title"),
          actions: const [
            BuildActionsSearch(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.colorObscure,
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
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: AppColors.backgroudColorThree,
            border: Border.all(
              color: AppColors.colorObscure.withOpacity(0.5),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: RowCategories(
                      categories: productController.menuCategories),
                ),
                const SizedBox(
                  height: 20,
                ),
                (productController.addProductos.value.isEmpty &&
                        (productController.isSearching.value == false ||
                            productController.searchQueryController.text == ""))
                    ? Flexible(
                        child: (productController
                                .productsListPerCategory.value.isNotEmpty)
                            ? ProductsGridView(
                                productsToShow: productController
                                    .productsListPerCategory.value)
                            : ProductsGridView(
                                productsToShow:
                                    productController.productsList.value),
                      )
                    : Flexible(
                        child: ProductsGridView(
                            productsToShow:
                                productController.addProductos.value),
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
