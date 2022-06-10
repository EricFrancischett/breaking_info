import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/repositories/episodes_repository.dart';
import 'package:breaking_info/features/home/data/seasons_error.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoadEpisodesHomePageUseCase {
  Future<Resource<List<EpisodesEntity>, EpisodesError>> fetchAllEpisodes();
}

class DefaultLoadEpisodesHomePageUseCase
    implements LoadEpisodesHomePageUseCase {
  @override
  Future<Resource<List<EpisodesEntity>, EpisodesError>>
      fetchAllEpisodes() async {
    final _reposiroty = Modular.get<EpisodesRepository>();
    final resource = await _reposiroty.fetchAllEpisodes();

    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    return Resource.success(data: resource.data);
  }
}
