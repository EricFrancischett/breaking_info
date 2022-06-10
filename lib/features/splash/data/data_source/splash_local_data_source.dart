import 'dart:ffi';

import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/splash_error.dart';
import 'package:hive/hive.dart';

abstract class SplashLocalDataSource {
  Future<Resource<Map<dynamic, dynamic>, SplashError>> fetchLocalCredentials();
}

class SplashHiveLocalDataSource implements SplashLocalDataSource {
  final _hive = Hive.box<Map<dynamic, dynamic>>('credentials');

  @override
  Future<Resource<Map<dynamic, dynamic>, SplashError>>
      fetchLocalCredentials() async {
    final response = await _hive.get('current_user');
    if (response == null) {
      return Resource.failed(error: SplashError.credentialsNotFound);
    }
    return Resource.success(data: response);
  }
}