import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:breaking_info/widgets/app_button_seasons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpisodePage extends StatelessWidget {
  final EpisodesEntity episodeInfo;
  const EpisodePage({Key? key, required this.episodeInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: ColorsApp.defaultYellow,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.defaultBlack,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Episode ${episodeInfo.episode}",
                  style: GoogleFonts.cabin(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.defaultWhite),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${episodeInfo.title}",
                  style: GoogleFonts.cabin(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.defaultWhite),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Air Date: ${episodeInfo.airDate}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.cabin(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: ColorsApp.defaultWhite,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "List of Characters:",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.cabin(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: ColorsApp.defaultWhite,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: episodeInfo.characters!.length,
                  itemBuilder: (context, index) {
                    return AppButtonSeasons(
                      buttonTitle: '${episodeInfo.characters![index]}',
                      tileColor: ColorsApp.defaultYellow,
                      letterColor: ColorsApp.defaultBlack,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
