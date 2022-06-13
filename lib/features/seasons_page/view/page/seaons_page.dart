import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:breaking_info/widgets/app_button_seasons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SeasonsPage extends StatelessWidget {
  final List<EpisodesEntity> currentSeasonEpisodes;
  const SeasonsPage({Key? key, required this.currentSeasonEpisodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.defaultYellow,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentSeasonEpisodes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AppButtonSeasons(
                    tileColor: ColorsApp.defaultBlack,
                    letterColor: ColorsApp.defaultWhite,
                    buttonTitle:
                        "Episode ${currentSeasonEpisodes[index].episode}:  ${currentSeasonEpisodes[index].title}",
                    buttonFunction: () async {
                      await {
                        Modular.to.pushNamed('/episodes/',
                            arguments: currentSeasonEpisodes[index]),
                      };
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
