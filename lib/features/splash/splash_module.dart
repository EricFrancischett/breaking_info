import 'package:breaking_info/features/splash/data/data_source/splash_local_data_source.dart';
import 'package:breaking_info/features/splash/data/repositories/splash_repository.dart';
import 'package:breaking_info/features/splash/domain/use_cases/get_local_saved_credentials.dart';
import 'package:breaking_info/features/splash/view/controller/splash_controller.dart';
import 'package:breaking_info/features/splash/view/page/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SplashLocalDataSource>((i) => SplashHiveLocalDataSource()),
        Bind<SplashRepository>((i) => DefaultSplashRepository()),
        Bind<GetLocalSavedCredentialsUseCase>((i) => DefaultGetLocalSavedCredentialsUseCase()),
        Bind<SplashController>((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => SplashPage())
      ];
}
