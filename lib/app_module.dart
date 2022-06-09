import 'package:breaking_info/core/adapters/remote_client/remote_client.dart';
import 'package:breaking_info/features/home/home_module.dart';
import 'package:breaking_info/features/login/login_module.dart';
import 'package:breaking_info/features/register/register_module.dart';
import 'package:breaking_info/features/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RemoteClient>(
          (i) => DioRemoteClient(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          '/login/',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/register/',
          module: RegisterModule(),
        ),
        ModuleRoute(
          '/home/',
          module: HomeModule(),
        ),
      ];
}
