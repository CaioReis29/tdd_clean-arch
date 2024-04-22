import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodVideo extends StatefulWidget {

  final String url;

  const ApodVideo({super.key, required this.url});

  @override
  State<ApodVideo> createState() => _ApodVideoState();
}

class _ApodVideoState extends State<ApodVideo> {
  late String url;
  VideoPlatForm videoPlatForm = VideoPlatForm.standard;

  VideoPlayerController? videoPlayerController;
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    url = widget.url;
    checkVideoPlatform();
    super.initState();
  }

  @override
  void dispose() {
    if(videoPlayerController != null) videoPlayerController!.dispose();
    if(youtubePlayerController != null) youtubePlayerController!.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return buildVideoPlayer();
  }

  void checkVideoPlatform() {
    String youtubeHost = "https://www.youtube.com";
    String vimeoHost = "https://www.vimeo.com";

    if(url.substring(0, youtubeHost.length) == youtubeHost) {
      videoPlatForm = VideoPlatForm.youtube;
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url) ?? "",
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
      setState(() {});
    } else if(url.substring(0, vimeoHost.length) == vimeoHost) {
      videoPlatForm = VideoPlatForm.vimeo;
    } else {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url))..initialize().then((value) => setState((){}));
    }
  }

  Widget buildVideoPlayer() {
    Widget videoWidget;

    if(videoPlatForm == VideoPlatForm.youtube) {
      videoWidget = YoutubePlayer(controller: youtubePlayerController!);
    } else if(videoPlatForm == VideoPlatForm.vimeo) {
      videoWidget = VimeoVideoPlayer(url: url, autoPlay: false);
    } else {
      if(videoPlayerController!.value.hasError) {
        videoWidget = const Text("Sorry:( We can't play this video. Try open in you browser!");
      } else {
        videoWidget = videoPlayerController!.value.isInitialized
        ? GestureDetector(
          onTap: () => videoPlayerController!.value.isPlaying 
                  ? videoPlayerController!.pause() 
                  : videoPlayerController!.play(),
          child: Container(
            color: Colors.black,
            child: AspectRatio(aspectRatio: videoPlayerController!.value.aspectRatio, child: VideoPlayer(videoPlayerController!)),
          ),
        )
        : Container();
      }
      videoPlayerController!.play();
    }
    return videoWidget;
  }
}

enum VideoPlatForm { standard, youtube, vimeo }