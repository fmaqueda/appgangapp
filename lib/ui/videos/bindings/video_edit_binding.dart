import 'package:appgangapp/ui/chat/controllers/message_controller.dart';
import 'package:appgangapp/ui/videos/controllers/video_edit_controller.dart';
import 'package:get/get.dart';

class VideoEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoEditController());
  }
}
