import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  final CharactersEntity selectedCharacter;
  const CharactersPage({Key? key, required this.selectedCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: ColorsApp.defaultYellow,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 13,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.defaultBlack,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(selectedCharacter.name!),
                      Image.network(selectedCharacter.img!),
                      Row(
                        children: [
                          const Text("Birthday: "),
                          Text(selectedCharacter.birthday!),
                        ],
                      ),
                      const Text("Occupation:"),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectedCharacter.occupation!.length,
                          itemBuilder: (context, index) {
                            return Text(
                              selectedCharacter.occupation![index],
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
