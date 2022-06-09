import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/features/home/view/controller/home_page_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    _controller.fetchAllEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _controller.pageController,
          onPageChanged: (index) {
            _controller.bottomSelectedIndex = index;
          },
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Observer(
                      builder: (_) {
                        return _controller.characters.status == Status.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _controller.characters.data!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        "${_controller.characters.data![index].name}"),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(
                                          '${_controller.characters.data![index].img}'),
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Observer(
                      builder: (_) {
                        return _controller.episodes.status == Status.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _controller.episodes.data!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Text(
                                          "${_controller.episodes.data![index].title}"),
                                      leading: Text(
                                          'Season: ${_controller.episodes.data![index].season} Episode: ${_controller.episodes.data![index].episode}'));
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _controller.bottomSelectedIndex,
            onTap: (index) {
              _controller.bottomSelectedIndex = index;
              _controller.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(null, size: 0), label: 'Characters'),
              BottomNavigationBarItem(
                  icon: Icon(
                    null,
                    size: 0,
                  ),
                  label: 'Seasons')
            ]),
      ),
    );
  }
}
