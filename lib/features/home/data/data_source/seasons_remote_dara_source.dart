import 'package:breaking_info/core/constans/breaking_bad_api_routes.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/seasons_error.dart';
import 'package:dio/dio.dart';

abstract class EpisodesRemoteDataSource {
  Future<Resource<List<Map<String, dynamic>>, EpisodesError>>
      fetchAllEpisodes();
}

class ApiEpisodesDataSource implements EpisodesRemoteDataSource {
  final _dio = Dio();

  @override
  Future<Resource<List<Map<String, dynamic>>, EpisodesError>>
      fetchAllEpisodes() async {
    try {
      final response = await _dio.get(BreakingBadApiRoutes.allEpisodesApiRoute);
      if (response.statusCode != 200) {
        Resource.failed(error: EpisodesError.apiError);
      }
      final episodesList = List<Map<String, dynamic>>.from(response.data);
      return Resource.success(data: episodesList);
    } on DioError catch (e) {
      return Resource.failed(error: EpisodesError.apiError);
    }
  }
}
