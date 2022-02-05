import 'package:appgangapp/global_widgets/animations/overlay_navigation_widgets/build_overlay_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OverlayAnimation extends ModalRoute<void> {
  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black.withOpacity(0.8);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: BuildOverlayContent(),
      ),
    );
  }

  @override
  // TODO: implement maintainState
  bool get maintainState => true;

  @override
  // TODO: implement opaque
  bool get opaque => false;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween(
        begin: Offset(-1.0, 0.0),
        end: Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
