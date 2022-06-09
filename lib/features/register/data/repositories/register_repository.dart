import 'package:breaking_info/core/entities/user_entity.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/data_sources/register_local_data_source.dart';
import 'package:breaking_info/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RegisterRepository {
  Future<Resource<UserEntity, RegisterError>> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  );
    Future<Resource<void, RegisterError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class DefaultRegisterRepository implements RegisterRepository {
  final _remoteDataSource = Modular.get<RegisterRemoteDataSource>();
  final _localDataSource = Modular.get<RegisterLocalDataSource>();

  @override
  Future<Resource<UserEntity, RegisterError>> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final resource = await _remoteDataSource.registerUser(firstName, lastName, email, password);
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final userMap = resource.data;
    final userEntity = UserEntity.fromMap(userMap!);
    return Resource.success(data: userEntity);
  }

  @override
  Future<Resource<void, RegisterError>> localSaveCredentials(String firstName, String lastName, String token) async {
        try {
      await _localDataSource.localSaveCredentials(firstName, lastName, token);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: RegisterError.failSaving);
    }
  }
}
