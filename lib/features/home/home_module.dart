import 'package:breaking_info/features/home/data/data_source/characters_remote_data_source.dart';
import 'package:breaking_info/features/home/data/data_source/home_local_data_source.dart';
import 'package:breaking_info/features/home/data/data_source/seasons_remote_dara_source.dart';
import 'package:breaking_info/features/home/data/repositories/characters_repository.dart';
import 'package:breaking_info/features/home/data/repositories/episodes_repository.dart';
import 'package:breaking_info/features/home/data/repositories/home_repository.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_characters_use_case.dart';
import 'package:breaking_info/features/home/domain/use_cases/fetch_episodes_use_case.dart';
import 'package:breaking_info/features/home/domain/use_cases/logout_use_case.dart';
import 'package:breaking_info/features/home/view/controller/home_page_controller.dart';
import 'package:breaking_info/features/home/view/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<CharactersRemoteDataSource>((i) => ApiCharactersDataSource()),
        Bind<HomeLocalDataSource>((i) => HiveHomeLocalDataSource()),
        Bind<CharactersRepository>(
          (i) => DefaultCharactersRepository(),
        ),
        Bind<HomeRepository>((i) => DefaultHomeRepository()),
        Bind<LoadCharacterHomePageUseCase>(
          (i) => DefaultLoadCharacterHomePageUseCase(),
        ),
        Bind<LogoutUseCase>((i) => DefaultLogoutUseCase()),
        Bind<HomePageController>(((i) => HomePageController())),
        Bind<EpisodesRemoteDataSource>((i) => ApiEpisodesDataSource(),),
        Bind<EpisodesRepository>((i) => DefaultEpisodesRepository(),),
        Bind<LoadEpisodesHomePageUseCase>((i) => DefaultLoadEpisodesHomePageUseCase(),)
      ];

  @override
  List<ModularRoute> get routes => [ChildRoute(Modular.initialRoute, child: ((context, args) => HomePage(userFirstName: args.data['first_name'], userLastName: args.data['last_name'],)))];
}
