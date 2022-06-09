import 'package:breaking_info/core/constans/breaking_bad_api_routes.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/characters_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class CharactersRemoteDataSource {
  Future<Resource<List<Map<String, dynamic>>, CharactersError>>
      fetchCharacters();
}

class ApiCharactersDataSource implements CharactersRemoteDataSource {
  final _dio = Dio();

  @override
  Future<Resource<List<Map<String, dynamic>>, CharactersError>>
      fetchCharacters() async {
    try {
      final response =
          await _dio.get(BreakingBadApiRoutes.allCharactrsApiRoute);
      if (response.statusCode != 200) {
        return Resource.failed(error: CharactersError.apiError);
      }
      final characterList = List<Map<String, dynamic>>.from(response.data);
      return Resource.success(data: characterList);
    } on DioError catch (e) {
      return Resource.failed(error: CharactersError.apiError);
    }
  }
}
