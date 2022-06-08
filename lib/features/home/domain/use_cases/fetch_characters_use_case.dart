import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/characters_error.dart';
import 'package:breaking_info/features/home/data/repositories/characters_repository.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoadCharacterHomePageUseCase {
  Future<Resource<List<CharactersEntity>, CharactersError>> fetchCharacters();
}

class DefaultLoadCharacterHomePageUseCase
    implements LoadCharacterHomePageUseCase {
  @override
  Future<Resource<List<CharactersEntity>, CharactersError>> fetchCharacters() async {
    final _repository = Modular.get<CharactersRepository>();

    final resource = await _repository.fetchCharacters();
    if (resource.hasError) {
      return Resource.failed(error: CharactersError.apiError);
    }
    return Resource.success(data: resource.data);
  }
}
