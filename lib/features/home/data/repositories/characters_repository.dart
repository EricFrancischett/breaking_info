import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/characters_error.dart';
import 'package:breaking_info/features/home/data/data_source/characters_remote_data_source.dart';
import 'package:breaking_info/features/home/domain/entities/characters_enetity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class CharactersRepository {
  Future<Resource<List<CharactersEntity>, CharactersError>> fetchCharacters();
}

class DefaultCharactersRepository implements CharactersRepository {
  final _dataSource = Modular.get<CharactersRemoteDataSource>();

  @override
  Future<Resource<List<CharactersEntity>, CharactersError>>
      fetchCharacters() async {
    final resource = await _dataSource.fetchCharacters();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final charactersListMap = resource.data;
    // final charactersListEntity = CharactersEntity.fromMap(charactersMap!);
    final List<CharactersEntity> charactersListEntity =
        charactersListMap!.map((e) => CharactersEntity.fromMap(e)).toList();
    return Resource.success(data: charactersListEntity); 
  }
}
