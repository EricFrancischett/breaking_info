import 'package:breaking_info/features/characters/view/page/characters_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharactersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [ChildRoute(Modular.initialRoute, child: ((context, args) => CharactersPage(selectedCharacter: args.data)))];
}