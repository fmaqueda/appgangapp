import 'package:appgangapp/ui/products/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownButtonCategory extends StatelessWidget {
  DropDownButtonCategory({Key? key}) : super(key: key);

  static const menuCategories = <String>[
    'HOMBRE',
    'MUJER',
    'NIÑOS',
    'EQUIPAMIENTO'
  ];

  final List<DropdownMenuItem<String>> _dropdownCategories = menuCategories
      .map((String value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();

    return DropdownButton<String>(
      value: productController.categorySelected.value,
      hint: const Text("Selecciona Categoria"),
      items: _dropdownCategories,
      onChanged: (String? newvalue) {
        if (newvalue != null) {
          productController.categorySelected.value = newvalue;
        }
      },
    );
  }
}
