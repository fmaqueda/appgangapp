import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/services/firestore/firestore_service_videos.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  var indexpage = 0.obs;

  Rx<List<VideoModel>> videosList = Rx<List<VideoModel>>([]);
  //Rx<List<VideoModel>> videosListPerCategory = Rx<List<VideoModel>>([]);

  @override
  void onReady() {
    videosList.bindStream(DatabaseVideos().videosStream());
    super.onReady();
  }
}
