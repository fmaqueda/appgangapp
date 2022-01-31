import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: textTheme,
  primaryTextTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  errorColor: AppColors.redError,
  colorScheme: lightColorScheme,
  primarySwatch: AppColors.primary,
  backgroundColor: AppColors.white,
  inputDecorationTheme: inputTheme,
);

//Nuevo Comentario

/// Create input decoration Theme
const InputDecorationTheme inputTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
);
