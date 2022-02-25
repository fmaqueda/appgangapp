import 'package:appgangapp/models/products/product_model.dart';
import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/ui/products/otherwidgets/product_widget.dart';
import 'package:appgangapp/ui/products/screens/product_details.dart';
import 'package:appgangapp/ui/videos/screens/video_play_screen.dart';
import 'package:appgangapp/ui/videos/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideosGridView extends StatelessWidget {
  final List<VideoModel> videosToShow;
  const VideosGridView({Key? key, required this.videosToShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        /*
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 4 / 5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      */
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0),
        itemCount: videosToShow.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              if (videosToShow[index].urlVid != null) {
                Get.to(VideoPlayerScreen(videoSelect: videosToShow[index]));
              }
              //Get.to(() {
              print("Video URL " + videosToShow[index].urlVid!);
              //}
              /*ProductDetails(
                  videoModel: videosToShow[index],
                ), */
              //);
            },
            child: VideoWidget(video: videosToShow[index]),
          );
        });
  }
}
