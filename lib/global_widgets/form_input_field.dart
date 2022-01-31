import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    Key? key,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.maxLines,
    required this.minLines,
    required this.controller,
    required this.onChanged,
    required this.onSaved,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String? Function(String?)? validator;

  final String labelText;
  final String hintText;
  final bool obscureText;

  final int maxLines;
  final int minLines;
  final void Function(String) onChanged;
  final void Function(String?) onSaved;
  final TextEditingController controller;
  final TextInputType keyboardType;

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.notoSans(
          fontSize: 16, color: AppColors.backgroudColorFour),
      decoration: InputDecoration(
        labelStyle: GoogleFonts.notoSans(
          fontSize: 16,
          color: AppColors.backgroudColorThree,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide:
              BorderSide(color: AppColors.backgroudColorThree, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.backgroudColorFour, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.backgroudColorFour, width: 2),
        ),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
