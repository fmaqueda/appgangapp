import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  final String product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.colorObscure.withOpacity(0.5),
          width: 2.0,
        ),
      ),
      child: Center(
        child: Text(
          product,
          style:
              textThemePropio.subtitle2!.copyWith(color: AppColors.textColor),
        ),
      ),
    );
  }
}
