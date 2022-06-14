import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsApp.defaultBlack,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            selectedCharacter.name!,
                            style: FontsApp.mainFontText36
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Image.network(
                              selectedCharacter.img!,
                              width: 200,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Birthday: ",
                            style: FontsApp.mainFontText24
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                          Text(
                            selectedCharacter.birthday!,
                            style: FontsApp.mainFontText20
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Occupation:",
                        style: FontsApp.mainFontText24
                            .copyWith(color: ColorsApp.defaultWhite),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: selectedCharacter.occupation!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedCharacter.occupation![index],
                                style: FontsApp.mainFontText16
                                    .copyWith(color: ColorsApp.defaultWhite),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Nickname: ",
                            style: FontsApp.mainFontText24
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                          Text(
                            selectedCharacter.nickname!,
                            style: FontsApp.mainFontText20
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Appearance (Seasons): ",
                        style: FontsApp.mainFontText24
                            .copyWith(color: ColorsApp.defaultWhite),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // for (var i = 1; i <= 5; i++) {
                          //   return Container();
                          // }
                          Container(
                            width: 34,
                            height: 34,
                            child: Center(
                              child: Text(
                                "1",
                                style: FontsApp.mainFontText24.copyWith(
                                    color: selectedCharacter.appearance!
                                            .toString()
                                            .contains("1")
                                        ? ColorsApp.defaultBlack
                                        : ColorsApp.defaultWhite,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: selectedCharacter.appearance!
                                      .toString()
                                      .contains("1")
                                  ? ColorsApp.defaultYellow
                                  : ColorsApp.defaultBlack,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            child: Center(
                              child: Text(
                                "2",
                                style: FontsApp.mainFontText24.copyWith(
                                    color: selectedCharacter.appearance!
                                            .toString()
                                            .contains("2")
                                        ? ColorsApp.defaultBlack
                                        : ColorsApp.defaultWhite,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: selectedCharacter.appearance!
                                      .toString()
                                      .contains("2")
                                  ? ColorsApp.defaultYellow
                                  : ColorsApp.defaultBlack,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            child: Center(
                              child: Text(
                                "3",
                                style: FontsApp.mainFontText24.copyWith(
                                    color: selectedCharacter.appearance!
                                            .toString()
                                            .contains("3")
                                        ? ColorsApp.defaultBlack
                                        : ColorsApp.defaultWhite,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: selectedCharacter.appearance!
                                      .toString()
                                      .contains("3")
                                  ? ColorsApp.defaultYellow
                                  : ColorsApp.defaultBlack,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            child: Center(
                              child: Text(
                                "4",
                                style: FontsApp.mainFontText24.copyWith(
                                    color: selectedCharacter.appearance!
                                            .toString()
                                            .contains("4")
                                        ? ColorsApp.defaultBlack
                                        : ColorsApp.defaultWhite,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: selectedCharacter.appearance!
                                      .toString()
                                      .contains("4")
                                  ? ColorsApp.defaultYellow
                                  : ColorsApp.defaultBlack,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            child: Center(
                              child: Text(
                                "5",
                                style: FontsApp.mainFontText24.copyWith(
                                    color: selectedCharacter.appearance!
                                            .toString()
                                            .contains("5")
                                        ? ColorsApp.defaultBlack
                                        : ColorsApp.defaultWhite,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: selectedCharacter.appearance!
                                      .toString()
                                      .contains("5")
                                  ? ColorsApp.defaultYellow
                                  : ColorsApp.defaultBlack,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Status: ",
                            style: FontsApp.mainFontText24
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                          Text(
                            selectedCharacter.status!,
                            style: FontsApp.mainFontText20
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Portrayed by: ",
                            style: FontsApp.mainFontText24
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                          Text(
                            selectedCharacter.portrayed!,
                            style: FontsApp.mainFontText20
                                .copyWith(color: ColorsApp.defaultWhite),
                          ),
                        ],
                      ),
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
