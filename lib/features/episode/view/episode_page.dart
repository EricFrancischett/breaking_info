import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:flutter/material.dart';

class EpisodePage extends StatelessWidget {
  final EpisodesEntity episodeInfo;
  const EpisodePage({Key? key, required this.episodeInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${episodeInfo.airDate}'),
          Text('${episodeInfo.episode}'),
          Text('${episodeInfo.title}'),
          ListView.builder(shrinkWrap: true, itemCount: episodeInfo.characters!.length, itemBuilder: (context, index) {
            return Text('${episodeInfo.characters![index]}');
          })
        ],
      ),
    );
  }
}
