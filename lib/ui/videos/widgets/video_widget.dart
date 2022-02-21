import 'package:appgangapp/models/videos/video_model.dart';
import 'package:appgangapp/ui/theme/color_theme.dart';
import 'package:appgangapp/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  final VideoModel video;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.colorObscure.withOpacity(0.6),
          width: 0.0,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: (video.urlImage != null)
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        child: Image.network(
                          video.urlImage!,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      )
                    : const Text("No Image"),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: (video.name != null)
                    ? Text(
                        video.name!,
                        style: textThemePropio.subtitle2!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      )
                    : Text(
                        "Name of Video Not Recovered",
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                        textAlign: TextAlign.start,
                      ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: (video.subtitle != null)
                    ? Text(
                        video.subtitle!,
                        textAlign: TextAlign.start,
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                      )
                    : Text(
                        "Subtitle Not Recovered",
                        style: textThemePropio.subtitle2!
                            .copyWith(color: AppColors.textColor),
                        textAlign: TextAlign.start,
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
