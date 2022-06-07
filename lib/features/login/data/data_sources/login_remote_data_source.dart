import 'package:breaking_info/core/adapters/remote_client/remote_client.dart';
import 'package:breaking_info/core/constans/auth_api_routes.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/login/data/login_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoginRemoteDataSource {
  Future<Resource<Map<String, dynamic>, LoginError>> loginUser(
      String email, String password);
}

class ApiLoginRemoteDataSource implements LoginRemoteDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, LoginError>> loginUser(
      String email, String password) async {
    final response = await _remoteClient.post(
      AuthApiRoutes.loginApiRoute,
      {"email": email, "password": password},
    );
    if (response.statusCode != 201) {
      return Resource.failed(error: LoginError.invalidCredentials);
    }
    return Resource.success(data: response.data);
  }
}