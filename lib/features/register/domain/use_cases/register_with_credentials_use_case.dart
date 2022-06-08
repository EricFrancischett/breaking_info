import 'package:breaking_info/core/entities/user_entity.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:breaking_info/features/register/data/repositories/register_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RegisterWithCredentialsUseCase {
  Future<Resource<UserEntity, RegisterError>> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  );
}

class DefaultRegisterWithCredentialsUseCase
    implements RegisterWithCredentialsUseCase {
  @override
  Future<Resource<UserEntity, RegisterError>> registerUser(
      String firstName, String lastName, String email, String password) async {
    final _repository = Modular.get<RegisterRepository>();
    final resource =
        await _repository.registerUser(firstName, lastName, email, password);
    if (resource.hasError) {
      return Resource.failed(error: RegisterError.apiError);
    }
    return Resource.success(data: resource.data);
  }
}
