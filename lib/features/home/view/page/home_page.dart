import 'package:breaking_info/features/home/view/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();

  @override
  void initState() {
    _controller.fetchCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Observer(builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.characters.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text("${_controller.characters.data![index].name}"),
                        leading: ClipOval(
                          child: Image.network(
                              '${_controller.characters.data![index].img}'),
                        ),
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
