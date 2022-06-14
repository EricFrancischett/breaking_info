import 'package:breaking_info/core/entities/user_entity.dart';
import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/register/data/register_error.dart';
import 'package:breaking_info/features/register/domain/use_cases/register_local_save_credentials_use_case.dart';
import 'package:breaking_info/features/register/domain/use_cases/register_with_credentials_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final _registerWithCredentials =
      Modular.get<DefaultRegisterWithCredentialsUseCase>();
  final _localSaveCredentials =
      Modular.get<RegisterLocalSaveCredentialsUseCase>();

  @observable
  String firstName = '';
  @action
  void changeFirstName(String newValue) => firstName = newValue;

  @computed
  bool get isFirstNameValid => firstName.isNotEmpty;

  @observable
  String lastName = '';
  @action
  void changeLastName(String newValue) => lastName = newValue;

  @computed
  bool get isLastNameValid => lastName.isNotEmpty;

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid => email.contains('@') && email.contains('.com');

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @observable
  bool isPasswordVisible = false;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get isPasswordValid => password.length >= 6 && password.length <= 12;

  @observable
  String passwordConfirmation = '';

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

  @observable
  bool isPasswordConfirmationVisible = false;

  @action
  void changePasswordConfirmationVisibility() =>
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @computed
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @computed
  bool get allCredentialIsValid =>
      isPasswordValid &&
      isPasswordConfirmationValid &&
      isFirstNameValid &&
      isLastNameValid &&
      isEmailValid;

  @observable
  bool isButtonAtLoadingStatus = false;

  @action
  void setButtonToLoadingStatus() => isButtonAtLoadingStatus = true;

  @action
  void setButtonToNotLoadingStatus() => isButtonAtLoadingStatus = false;

  @observable
  Resource<UserEntity, RegisterError> user = Resource.loading();

  @action
  Future<Resource<void, RegisterError>> registerUser() async {
    final resource = await _registerWithCredentials.registerUser(
        firstName, lastName, email, password);
    if (resource.hasError) {
      return Resource.failed(error: RegisterError.apiError);
    }
    user = resource;
    return Resource.success();
  }

  @action
  Future<Resource<void, RegisterError>> localSaveCredentials() async {
    try {
      _localSaveCredentials.localSaveCredentials(
          user.data!.firstName!, user.data!.lastName!, user.data!.token!);
      return Resource.success();
    } catch (e) {
      return Resource.failed(error: RegisterError.failSaving);
    }
  }
}
