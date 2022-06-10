import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/data_source/splash_local_data_source.dart';
import 'package:breaking_info/features/splash/data/splash_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SplashRepository {
  Future<Resource<Map<String, String>, SplashError>> userCredentials();
}

class DefaultSplashRepository implements SplashRepository {
  final _dataSource = Modular.get<SplashLocalDataSource>();
  @override
  Future<Resource<Map<String, String>, SplashError>> userCredentials() async {
    final resource = await _dataSource.fetchLocalCredentials();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final Map<String, String> userCredential = {
      "token": resource.data!["token"],
      "first_name": resource.data!["first_name"],
      "last_name": resource.data!["last_name"],
    };
    return Resource.success(data: userCredential);
  }
}