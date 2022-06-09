import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/domain/use_cases/get_local_saved_credentials.dart';
import 'package:breaking_info/features/splash/data/splash_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SplashRepository {
  Future<Resource<String, SplashError>> userCredentials();
}

class DefaultSplashRepository implements SplashRepository {
  final _dataSource = Modular.get<DefaultGetLocalSavedCredentialsUseCase>();
  @override
  Future<Resource<String, SplashError>> userCredentials() async {
    final resource = await _dataSource.getLocalSavedCredentials();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final userCredential = resource.data;
    return Resource.success(data: userCredential);
  }
}