import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/logout_error.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  Future<Resource<void, LogoutError>> logout();
}

class HiveHomeLocalDataSource implements HomeLocalDataSource {
  final _hive = Hive.box<Map<dynamic, dynamic>>('credentials');
  
  @override
  Future<Resource<void, LogoutError>> logout() async {
    try {
      await _hive.delete("current_user");
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LogoutError.failLogout);
    }
  }
}