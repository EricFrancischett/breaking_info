import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/data/logout_error.dart';
import 'package:breaking_info/features/home/data/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LogoutUseCase {
  Future<Resource<void, LogoutError>> logout();
}

class DefaultLogoutUseCase implements LogoutUseCase {
  final _repository = Modular.get<HomeRepository>();

  @override
  Future<Resource<void, LogoutError>> logout() async {
    try {
      await _repository.logout();
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LogoutError.failLogout);
    }
  }
}
