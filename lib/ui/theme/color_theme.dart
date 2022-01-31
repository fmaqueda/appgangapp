import 'package:flutter/material.dart';

final ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.black,
    background: AppColors.white,
    error: AppColors.redError,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.black,
    onBackground: AppColors.black,
    onError: AppColors.white,
    primaryVariant: AppColors.primary[600]!,
    secondaryVariant: AppColors.secondary[800]!,
    brightness: Brightness.light);

class AppColors {
  static const MaterialColor primary = MaterialColor(0xfffd355d, {
    50: Color(0xffffeaf0),
    100: Color(0xffffcad7),
    200: Color(0xfff693a2),
    300: Color(0xffef667d),
    400: Color(0xfffd355d), // default
    500: Color(0xffff0044),
    600: Color(0xfff60043), // variant
    700: Color(0xffe3003c),
    800: Color(0xffd70034),
    900: Color(0xffc70027),
  });

  static const MaterialColor secondary = MaterialColor(0xff3588fd, {
    50: Color(0xffe4f2ff),
    100: Color(0xffbddfff),
    200: Color(0xff93ccff),
    300: Color(0xff67b7ff),
    400: Color(0xff48a7ff),
    500: Color(0xff3297ff),
    600: Color(0xff3588fd), // default
    700: Color(0xff3575e9),
    800: Color(0xff3464d6), // variant
    900: Color(0xff3243b6),
  });

  static const Color redError = Color(0xffb00020);

  static const Color colorButton = Color(0xff8fd974);
  static const Color backgroudColorOne = Color(0xff8fd974);
  static const Color backgroudColorTwo = Color(0xff7AC968);
  static const Color backgroudColorThree = Color(0xff5bb462);
  static const Color backgroudColorFour = Color(0xff4ca456);
  static const Color colorObscure = Color(0xff394141);

  static const Color textColor = Color(0xff394141);
  static const Color textColorAlt = Color(0xff5bb462);

  static const Color orange = Color(0xfff5a523);
  static const Color green = Color(0xff7ed221);
  static const Color red = Color(0xffd0011b);
  static const Color blueBackground = Color(0xffebf3ff);

  static const Color orangeButton = Color(0xffFFB449);

  static const Color blackTest = Colors.black;
  static const Color greyTest = Colors.grey;

  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
