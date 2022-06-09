import 'package:breaking_info/features/register/data/data_sources/register_local_data_source.dart';
import 'package:breaking_info/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:breaking_info/features/register/data/repositories/register_repository.dart';
import 'package:breaking_info/features/register/domain/use_cases/register_local_save_credentials_use_case.dart';
import 'package:breaking_info/features/register/domain/use_cases/register_with_credentials_use_case.dart';
import 'package:breaking_info/features/register/view/controller/register_controller.dart';
import 'package:breaking_info/features/register/view/page/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RegisterRemoteDataSource>((i) => ApiRegisterRemoteDataSource()),
        Bind<RegisterLocalDataSource>((i) => HiveRegisterLocalDataSource()),
        Bind<RegisterRepository>((i) => DefaultRegisterRepository()),
        Bind<RegisterWithCredentialsUseCase>((i) => DefaultRegisterWithCredentialsUseCase()),
        Bind<RegisterLocalSaveCredentialsUseCase>((i) => DefaultRegisterLocalSaveCredentialsUseCase()),
        Bind<RegisterController>((i) => RegisterController())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => RegisterPage())
      ];
}
