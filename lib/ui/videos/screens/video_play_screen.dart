import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key, required this.videoSelect})
      : super(key: key);

  final VideoModel videoSelect;

  @override
  Widget build(BuildContext context) {
    String? videoId = YoutubePlayer.convertUrlToId(videoSelect.urlVid!);

    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          onEnded: (metadata) {
            Get.back();
          },
          //aspectRatio: 1,
          controller: _controller,
        ),
        builder: (context, player) => Scaffold(
          appBar: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? AppBar(
                  backgroundColor: AppColors.backgroudColorOne,
                  title: Text(videoSelect.name!),
                )
              : null,
          body: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.black,
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: player,
              ),
            ),
          ]),
        ),
      ),

      /*
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.black,
          ),
          Center(
            child: YoutubePlayer(
              controller: _controller,
              liveUIColor: AppColors.backgroudColorOne,
              onReady: () {},
              onEnded: (metadata) => Get.back(),
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
                FullScreenButton(),
                RemainingDuration(),
              ],
            ),
          ),
        ],
      ),
      */
    );
  }
}
