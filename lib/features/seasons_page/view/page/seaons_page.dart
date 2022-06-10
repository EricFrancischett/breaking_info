import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:flutter/material.dart';

class SeasonsPage extends StatelessWidget {
  final List<EpisodesEntity> currentSeasonEpisodes;
  const SeasonsPage({Key? key, required this.currentSeasonEpisodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 7, 7),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text("${currentSeasonEpisodes[index].title}"),
                    leading: Text(
                        'Episode: ${currentSeasonEpisodes[index].episode}'));
              },
            )
          ],
        ),
      ),
    );
  }
}
