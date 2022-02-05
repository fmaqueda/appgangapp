import 'package:appgangapp/global_widgets/buttons/icon_buttom_nav.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {Key? key, required this.onIndexChanged, required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;
  final Function(int) onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtomBotNav(
              index: 0,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.home,
            ),
            IconButtomBotNav(
              index: 1,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.star,
            ),
            IconButtomBotNav(
              index: 2,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.shop,
            ),
            IconButtomBotNav(
                index: 3,
                selectedIndex: selectedIndex,
                onIndexChanged: onIndexChanged,
                iconData: Icons.person),
          ],
        ),
      ),
    );
  }
}
