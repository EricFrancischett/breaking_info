import 'package:breaking_info/features/home/data/data_source/characters_remote_data_source.dart';
import 'package:breaking_info/features/home/data/repositories/characters_repository.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_characters_use_case.dart';
import 'package:breaking_info/features/home/view/controller/home_page_controller.dart';
import 'package:breaking_info/features/home/view/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<CharactersRemoteDataSource>((i) => ApiHomeRemoteDataSource()),
        Bind<CharactersRepository>(
          (i) => DefaultCharactersRepository(),
        ),
        Bind<LoadCharacterHomePageUseCase>(
          (i) => DefaultLoadCharacterHomePageUseCase(),
        ),
        Bind<HomePageController>(((i) => HomePageController())),
      ];

  @override
  List<ModularRoute> get routes => [ChildRoute(Modular.initialRoute, child: ((context, args) => HomePage()))];
}
