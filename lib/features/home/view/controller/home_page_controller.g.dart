// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$bottomSelectedIndexAtom = Atom(
      name: '_HomePageControllerBase.bottomSelectedIndex', context: context);

  @override
  int get bottomSelectedIndex {
    _$bottomSelectedIndexAtom.reportRead();
    return super.bottomSelectedIndex;
  }

  @override
  set bottomSelectedIndex(int value) {
    _$bottomSelectedIndexAtom.reportWrite(value, super.bottomSelectedIndex, () {
      super.bottomSelectedIndex = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: '_HomePageControllerBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: '_HomePageControllerBase.characters', context: context);

  @override
  Resource<List<CharactersEntity>, CharactersError> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(Resource<List<CharactersEntity>, CharactersError> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$episodesAtom =
      Atom(name: '_HomePageControllerBase.episodes', context: context);

  @override
  Resource<List<EpisodesEntity>, EpisodesError> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(Resource<List<EpisodesEntity>, EpisodesError> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  late final _$seasonOneAtom =
      Atom(name: '_HomePageControllerBase.seasonOne', context: context);

  @override
  ObservableList<EpisodesEntity> get seasonOne {
    _$seasonOneAtom.reportRead();
    return super.seasonOne;
  }

  @override
  set seasonOne(ObservableList<EpisodesEntity> value) {
    _$seasonOneAtom.reportWrite(value, super.seasonOne, () {
      super.seasonOne = value;
    });
  }

  late final _$seasonTwoAtom =
      Atom(name: '_HomePageControllerBase.seasonTwo', context: context);

  @override
  ObservableList<EpisodesEntity> get seasonTwo {
    _$seasonTwoAtom.reportRead();
    return super.seasonTwo;
  }

  @override
  set seasonTwo(ObservableList<EpisodesEntity> value) {
    _$seasonTwoAtom.reportWrite(value, super.seasonTwo, () {
      super.seasonTwo = value;
    });
  }

  late final _$seasonThreeAtom =
      Atom(name: '_HomePageControllerBase.seasonThree', context: context);

  @override
  ObservableList<EpisodesEntity> get seasonThree {
    _$seasonThreeAtom.reportRead();
    return super.seasonThree;
  }

  @override
  set seasonThree(ObservableList<EpisodesEntity> value) {
    _$seasonThreeAtom.reportWrite(value, super.seasonThree, () {
      super.seasonThree = value;
    });
  }

  late final _$seasonFourAtom =
      Atom(name: '_HomePageControllerBase.seasonFour', context: context);

  @override
  ObservableList<EpisodesEntity> get seasonFour {
    _$seasonFourAtom.reportRead();
    return super.seasonFour;
  }

  @override
  set seasonFour(ObservableList<EpisodesEntity> value) {
    _$seasonFourAtom.reportWrite(value, super.seasonFour, () {
      super.seasonFour = value;
    });
  }

  late final _$seasonFiveAtom =
      Atom(name: '_HomePageControllerBase.seasonFive', context: context);

  @override
  ObservableList<EpisodesEntity> get seasonFive {
    _$seasonFiveAtom.reportRead();
    return super.seasonFive;
  }

  @override
  set seasonFive(ObservableList<EpisodesEntity> value) {
    _$seasonFiveAtom.reportWrite(value, super.seasonFive, () {
      super.seasonFive = value;
    });
  }

  late final _$fetchCharactersAsyncAction =
      AsyncAction('_HomePageControllerBase.fetchCharacters', context: context);

  @override
  Future<Resource<List<CharactersEntity>, CharactersError>> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  late final _$fetchAllEpisodesAsyncAction =
      AsyncAction('_HomePageControllerBase.fetchAllEpisodes', context: context);

  @override
  Future<Resource<List<EpisodesEntity>, EpisodesError>> fetchAllEpisodes() {
    return _$fetchAllEpisodesAsyncAction.run(() => super.fetchAllEpisodes());
  }

  @override
  String toString() {
    return '''
bottomSelectedIndex: ${bottomSelectedIndex},
pageController: ${pageController},
characters: ${characters},
episodes: ${episodes},
seasonOne: ${seasonOne},
seasonTwo: ${seasonTwo},
seasonThree: ${seasonThree},
seasonFour: ${seasonFour},
seasonFive: ${seasonFive}
    ''';
  }
}
