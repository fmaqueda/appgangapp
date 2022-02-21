import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/services/firestore/firestore_service_videos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoEditController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();
  TextEditingController urlVidController = TextEditingController();

  var urlImageProduct = ''.obs;
  var pathImageProduct = ''.obs;

  String genProductUID() {
    return DatabaseVideos().generateUID();
  }

  Future<bool> saveNewVideo(VideoModel video) async {
    return DatabaseVideos().saveNewVideo(video);
  }
}
