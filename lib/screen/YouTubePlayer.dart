import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Helper/constant.dart';
import 'package:movie_app/core/Movie/cubit.dart';
import 'package:movie_app/core/Movie/states.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayer extends StatefulWidget {
  const YouTubePlayer({Key? key}) : super(key: key);

  @override
  State<YouTubePlayer> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late YoutubePlayerController controller;

  @override
  initState() {
    var url = MovieCubit.get(context).youTubeId!.results![0].key;
    controller = YoutubePlayerController(
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          loop: false,
          enableCaption: true,

        ),
        initialVideoId: url!)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    controller.toggleFullScreenMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      builder: (context, state) {
        return YoutubePlayerBuilder(
          player: YoutubePlayer(controller: controller),
          builder: (_, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              body: ListView(
                children: [
                  child,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: primaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.toggleFullScreenMode();
                          },
                          child: const Icon(Icons.fullscreen_rounded),
                        ),
                        TextButton(
                            onPressed: () {
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                controller.play();
                              }
                            },
                            child: controller.value.isPlaying
                                ? const Icon(Icons.stop_circle_outlined)
                                : const Icon(Icons.play_arrow)),
                        IconButton(
                          onPressed: () {
                            controller.seekTo(const Duration(seconds: 5));
                          },
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            );
          },
        );
      },
      listener: (context, state) {},
    );
  }
}
