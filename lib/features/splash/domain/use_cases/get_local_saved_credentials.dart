import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/repositories/splash_repository.dart';
import 'package:breaking_info/features/splash/data/splash_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class GetLocalSavedCredentialsUseCase {
  Future<Resource<Map<String, String>, SplashError>> getLocalSavedCredentials();
}

class DefaultGetLocalSavedCredentialsUseCase
    implements GetLocalSavedCredentialsUseCase {
  @override
  Future<Resource<Map<String, String>, SplashError>> getLocalSavedCredentials() async {
    final _repository = Modular.get<SplashRepository>();
    final resource = await _repository.userCredentials();
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final userCredential = resource.data;
    return Resource.success(data: userCredential);
  }
}
