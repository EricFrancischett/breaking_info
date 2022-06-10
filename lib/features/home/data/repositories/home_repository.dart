import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/data_source/home_local_data_source.dart';
import 'package:breaking_info/features/home/data/logout_error.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class HomeRepository {
  Future<Resource<void, LogoutError>> logout();
}

class DefaultHomeRepository implements HomeRepository {
  final _dataSource = Modular.get<HomeLocalDataSource>();

  @override
  Future<Resource<void, LogoutError>> logout() async {
    try {
      await _dataSource.logout();
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LogoutError.failLogout);
    }
  }

}