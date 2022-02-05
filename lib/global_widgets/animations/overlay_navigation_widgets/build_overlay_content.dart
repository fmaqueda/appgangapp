import 'package:appgangapp/global_widgets/animations/overlay_navigation_widgets/build_overlay_category.dart';
import 'package:flutter/material.dart';

class BuildOverlayContent extends StatelessWidget {
  const BuildOverlayContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> routesTitles = ["HOME", "ADD PRODUCT"];
    List<String> routesOverlay = ['/home', '/addproduct'];
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: routesOverlay.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BuildOverlayCategory(
              routeText: routesTitles[index],
              routeOverlay: routesOverlay[index],
            ),
          ),
        ),
      ),
    );
  }
}
