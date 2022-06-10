import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/characters_error.dart';
import 'package:breaking_info/features/home/data/seasons_error.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_characters_use_case.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_episodes_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final _loadCharacterHomePageUseCase =
      Modular.get<LoadCharacterHomePageUseCase>();

  final _loadEpisodesHomePageUseCase =
      Modular.get<LoadEpisodesHomePageUseCase>();

  @observable
  int bottomSelectedIndex = 0;

  @observable
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @observable
  Resource<List<CharactersEntity>, CharactersError> characters =
      Resource.loading();

  @observable
  Resource<List<EpisodesEntity>, EpisodesError> episodes = Resource.loading();

  @observable
  ObservableList<EpisodesEntity> seasonOne = <EpisodesEntity>[].asObservable();

  @observable
  ObservableList<EpisodesEntity> seasonTwo = <EpisodesEntity>[].asObservable();

  @observable
  ObservableList<EpisodesEntity> seasonThree = <EpisodesEntity>[].asObservable();

  @observable
  ObservableList<EpisodesEntity> seasonFour = <EpisodesEntity>[].asObservable();

  @observable
  ObservableList<EpisodesEntity> seasonFive = <EpisodesEntity>[].asObservable();

  @action
  Future<Resource<List<CharactersEntity>, CharactersError>>
      fetchCharacters() async {
    final resource = await _loadCharacterHomePageUseCase.fetchCharacters();
    if (resource.hasError) {
      return Resource.failed(error: CharactersError.unknown);
    }
    characters = resource;
    return Resource.success();
  }

  @action
  Future<Resource<List<EpisodesEntity>, EpisodesError>>
      fetchAllEpisodes() async {
    final resource = await _loadEpisodesHomePageUseCase.fetchAllEpisodes();
    if (resource.hasError) {
      return Resource.failed(error: EpisodesError.unknown);
    }
    episodes = resource;

    for (var x = 0; x < episodes.data!.length; x++) {
      if (episodes.data![x].season == "1") {
        seasonOne.add(episodes.data![x]);
      }
      if (episodes.data![x].season == "2") {
        seasonTwo.add(episodes.data![x]);
      }
      if (episodes.data![x].season == "3") {
        seasonThree.add(episodes.data![x]);
      }
      if (episodes.data![x].season == "4") {
        seasonFour.add(episodes.data![x]);
      }
      if (episodes.data![x].season == "5") {
        seasonFive.add(episodes.data![x]);
      }
    }

    return Resource.success();
  }
}
