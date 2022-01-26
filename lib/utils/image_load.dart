import 'dart:developer';

import 'package:flutter/material.dart';

class ImageLoadPerfil {
  Widget imageGetPhoto(String? imageUrl, {double radius = 50.0}) {
    if (imageUrl != null) {
      try {
        return CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(imageUrl),
          radius: radius,
        );
      } catch (e) {
        log("$e");
        return CircleAvatar(
          backgroundColor: Colors.white,
          child: FlutterLogo(
            size: 40,
          ),
        );
      }
    } else {
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(
          size: 40,
        ),
      );
    }
  }
}
