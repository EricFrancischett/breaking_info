import 'package:breaking_info/core/adapters/remote_client/remote_client.dart';
import 'package:breaking_info/core/constans/auth_api_routes.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RegisterRemoteDataSource {
  Future<Resource<Map<String, dynamic>, RegisterError>> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
  );
}

class ApiRegisterRemoteDataSource implements RegisterRemoteDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, RegisterError>> registerUser(
      String firstName, String lastName, String email, String password) async {
    final response = await _remoteClient.post(
      AuthApiRoutes.registerApiRoute,
      {
        "first_name": email,
        "last_name": lastName,
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode != 201) {
      return Resource.failed(error: RegisterError.apiError);
    }
    return Resource.success(data: response.data);
  }
}
