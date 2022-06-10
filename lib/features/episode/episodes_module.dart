import 'package:breaking_info/features/episode/view/episode_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EpisodesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [ChildRoute(Modular.initialRoute, child: ((context, args) => EpisodePage(episodeInfo: args.data)))];
}