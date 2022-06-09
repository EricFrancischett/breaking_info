import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/login/data/data_sources/login_local_data_source.dart';
import 'package:breaking_info/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:breaking_info/features/login/data/login_error.dart';
import 'package:breaking_info/core/entities/user_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoginRepository {
  Future<Resource<UserEntity, LoginError>> loginUser(
      String email, String password);
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class DefaultLoginRepository implements LoginRepository {
  final _remoteDataSource = Modular.get<LoginRemoteDataSource>();
  final _localDataSource = Modular.get<LoginLocalDataSource>();

  @override
  Future<Resource<UserEntity, LoginError>> loginUser(
      String email, String password) async {
    final resource = await _remoteDataSource.loginUser(email, password);
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }
    final userMap = resource.data;
    final userEntity = UserEntity.fromMap(userMap!);
    return Resource.success(data: userEntity);
  }

  @override
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token) async {
    try {
      await _localDataSource.localSaveCredentials(firstName, lastName, token);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LoginError.failSaving);
    }
  }
}
