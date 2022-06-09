import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/data_source/splash_local_data_source.dart';
import 'package:breaking_info/features/splash/data/splash_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class GetLocalSavedCredentialsUseCase {
  Future<Resource<String, SplashError>> getLocalSavedCredentials();
}

class DefaultGetLocalSavedCredentialsUseCase
    implements GetLocalSavedCredentialsUseCase {
  @override
  Future<Resource<String, SplashError>> getLocalSavedCredentials() async {
    final _dataSource = Modular.get<SplashLocalDataSource>();
    final resource = await _dataSource.fetchLocalCredentials();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final userCredential = resource.data;
    return Resource.success(data: userCredential);
  }
}
