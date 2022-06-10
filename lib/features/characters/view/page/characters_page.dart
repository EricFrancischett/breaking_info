import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  final CharactersEntity selectedCharacter;
  const CharactersPage({ Key? key, required this.selectedCharacter }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Image.network(selectedCharacter.img!),
          Text(selectedCharacter.name!),
          Text(selectedCharacter.nickname!),
          Text(selectedCharacter.birthday!),
          Text(selectedCharacter.portrayed!)
        ],
      ),
    );
  }
}