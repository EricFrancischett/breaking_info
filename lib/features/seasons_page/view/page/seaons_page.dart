import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SeasonsPage extends StatelessWidget {
  final List<EpisodesEntity> currentSeasonEpisodes;
  const SeasonsPage({Key? key, required this.currentSeasonEpisodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 210, 7),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              itemCount: currentSeasonEpisodes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Modular.to.pushNamed('/episodes/',
                        arguments: currentSeasonEpisodes[index]);
                  },
                  title: Text("${currentSeasonEpisodes[index].title}"),
                  leading:
                      Text('Episode: ${currentSeasonEpisodes[index].episode}'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
