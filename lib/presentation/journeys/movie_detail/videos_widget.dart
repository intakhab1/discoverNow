import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discovernow/common/constants/translation_constants.dart';
import 'package:discovernow/presentation/blocs/videos/videos_bloc.dart';
import 'package:discovernow/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:discovernow/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:discovernow/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key key,
    this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: TranslationConstants.watchTrailers,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WatchVideoScreen(
                    watchVideoArguments: WatchVideoArguments(_videos),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
