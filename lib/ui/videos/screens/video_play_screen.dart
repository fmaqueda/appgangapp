import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter and Youtube'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: AppColors.backgroudColorOne,
          onReady: () {},
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            FullScreenButton(),
            RemainingDuration(),
          ],
        ));
  }
}
