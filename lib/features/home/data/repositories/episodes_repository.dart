import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/data_source/seasons_remote_dara_source.dart';
import 'package:breaking_info/features/home/data/seasons_error.dart';
import 'package:breaking_info/features/home/domain/entities/episodes_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class EpisodesRepository {
  Future<Resource<List<EpisodesEntity>, EpisodesError>> fetchAllEpisodes();
}

class DefaultEpisodesRepository implements EpisodesRepository {
  final _dataSource = Modular.get<EpisodesRemoteDataSource>();

  @override
  Future<Resource<List<EpisodesEntity>, EpisodesError>> fetchAllEpisodes() async {
    final resource = await _dataSource.fetchAllEpisodes();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final episodesListMap = resource.data;
    final List<EpisodesEntity> episodesListEntity =
        episodesListMap!.map((e) => EpisodesEntity.fromMap(e)).toList();
    return Resource.success(data: episodesListEntity);
  }
}
