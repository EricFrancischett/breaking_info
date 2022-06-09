import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:breaking_info/features/register/data/repositories/register_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RegisterLocalSaveCredentialsUseCase {
  Future<Resource<void, RegisterError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class DefaultRegisterLocalSaveCredentialsUseCase
    implements RegisterLocalSaveCredentialsUseCase {
  final _repository = Modular.get<RegisterRepository>();

  @override
  Future<Resource<void, RegisterError>> localSaveCredentials(
      String firstName, String lastName, String token) async {
    try {
      _repository.localSaveCredentials(firstName, lastName, token);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: RegisterError.failSaving);
    }
  }
}