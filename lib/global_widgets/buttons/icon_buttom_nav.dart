import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';

class IconButtomBotNav extends StatelessWidget {
  const IconButtomBotNav(
      {Key? key,
      required this.iconData,
      required this.index,
      required this.onIndexChanged,
      required this.selectedIndex})
      : super(key: key);

  final IconData iconData;
  final int index;
  final Function(int) onIndexChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onIndexChanged.call(index);
      },
      icon: Icon(iconData),
      color: (selectedIndex == index)
          ? AppColors.backgroudColorOne
          : AppColors.black,
    );
  }
}
