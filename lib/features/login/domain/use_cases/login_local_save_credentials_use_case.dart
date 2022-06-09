import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/login/data/login_error.dart';
import 'package:breaking_info/features/login/data/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoginLocalSaveCredentialsUseCase {
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class DefaultLoginLocalSaveCredentialsUseCase
    implements LoginLocalSaveCredentialsUseCase {
  final _repository = Modular.get<LoginRepository>();

  @override
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token) async {
    try {
      _repository.localSaveCredentials(firstName, lastName, token);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LoginError.failSaving);
    }
  }
}
