import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/splash/data/repositories/splash_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _repository = Modular.get<SplashRepository>();

  @observable
  Resource setupStatus = Resource.loading();

  @observable
  String token = '';

  @action
  void _setTokenValue(String newValue) => token = newValue;

  @computed
  bool get isTokenValid => token.isNotEmpty && token.contains('ey');

  @action
  Future<void> checkIfTokenExistsAndIsValid() async {
    final response = await _repository.userCredentials();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    if (response.hasError) {
      setupStatus =
          Resource.failed(error: "Token is missing, please signIn again");
      await Modular.to.pushReplacementNamed(
        '/login/',
      );
    }
    _setTokenValue(response.data!["token"]!);
    setupStatus = Resource.success();
    await Modular.to.pushReplacementNamed(
      '/home/', arguments: {'first_name': response.data!['first_name'],
      'last_name': response.data!['last_name'],}
    );
  }
}
