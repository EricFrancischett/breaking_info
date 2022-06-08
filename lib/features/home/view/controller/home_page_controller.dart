import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/characters_error.dart';
import 'package:breaking_info/features/home/data/data_source/characters_remote_data_source.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_characters_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final _loadCharacterHomePageUseCase =
      Modular.get<LoadCharacterHomePageUseCase>();

  @observable
  Resource<List<CharactersEntity>, CharactersError> characters =
      Resource.loading();

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
}
