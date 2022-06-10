import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/login/data/login_error.dart';
import 'package:hive/hive.dart';

abstract class LoginLocalDataSource {
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class HiveLoginLocalDataSource implements LoginLocalDataSource {
  final _hive = Hive.box<Map<dynamic, dynamic>>('credentials');

  @override
  Future<Resource<void, LoginError>> localSaveCredentials(
      String firstName, String lastName, String token) async {
    try {
      await _hive.put("current_user",
        {
          'token': token,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LoginError.failSaving);
    }
  }
}
