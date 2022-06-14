import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/login/data/login_error.dart';
import 'package:breaking_info/core/entities/user_entity.dart';
import 'package:breaking_info/features/login/domain/use_cases/login_local_save_credentials_use_case.dart';
import 'package:breaking_info/features/login/domain/use_cases/login_with_credentials_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _loginWithCredentials = Modular.get<LoginWithCredentialsUseCase>();
  final _localSaveCredentials = Modular.get<LoginLocalSaveCredentialsUseCase>();

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
      email.isNotEmpty && email.contains('@') && email.contains(".com");

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isButtonAtLoadingStatus = false;

  @action
  void setButtonToLoadingStatus() => isButtonAtLoadingStatus = true;

  @action
  void setButtonToNotLoadingStatus() => isButtonAtLoadingStatus = false;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get areCredentialsValid => isEmailValid && isPasswordValid;

  @observable
  Resource<UserEntity, LoginError> user = Resource.loading();

  @action
  Future<Resource<void, LoginError>> loginUser() async {
    final resource = await _loginWithCredentials.loginUser(email, password);
    if (resource.hasError) {
      return Resource.failed(error: LoginError.invalidCredentials);
    }
    user = resource;
    return Resource.success();
  }

  @action
  Future<Resource<void, LoginError>> localSaveCredentials() async {
    try {
      _localSaveCredentials.localSaveCredentials(
          user.data!.firstName!, user.data!.lastName!, user.data!.token!);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: LoginError.failSaving);
    }
  }
}
