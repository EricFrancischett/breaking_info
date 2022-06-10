import 'package:breaking_info/features/seasons_page/view/controller/seasons_controller.dart';
import 'package:breaking_info/features/seasons_page/view/page/seaons_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SeasonModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SeasonsPageController>(((i) => SeasonsPageController())),
      ];

  @override
  List<ModularRoute> get routes => [ChildRoute(Modular.initialRoute, child: ((context, args) => SeasonsPage(currentSeasonEpisodes: args.data)))];
}
