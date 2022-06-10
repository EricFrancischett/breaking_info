import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:hive/hive.dart';

abstract class RegisterLocalDataSource {
  Future<Resource<void, RegisterError>> localSaveCredentials(
      String firstName, String lastName, String token);
}

class HiveRegisterLocalDataSource implements RegisterLocalDataSource {
  final _hive = Hive.box<Map<dynamic, dynamic>>('credentials');

  @override
  Future<Resource<void, RegisterError>> localSaveCredentials(
      String firstName, String lastName, String token) async {
    try {
      await _hive.put('current_user',
        {
          'token': token,
          'first_name': firstName,
          'last_name': lastName,
        },
      );
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: RegisterError.failSaving);
    }
  }
}