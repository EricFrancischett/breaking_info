import 'dart:ui';

import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/widgets/app_bar/custom_app_bar.dart';
import 'package:breaking_info/core/widgets/drawer/custom_drawer.dart';
import 'package:breaking_info/features/home/view/controller/home_page_controller.dart';
import 'package:breaking_info/widgets/app_button_seasons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String userFirstName;
  final String userLastName;
  const HomePage(
      {Key? key, required this.userFirstName, required this.userLastName})
      : super(key: key);

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
    return Scaffold(
      backgroundColor: ColorsApp.defaultYellow,
      endDrawer: CustomDrawer(
        firstName: widget.userFirstName,
        lastName: widget.userLastName,
        onPressed: () async {
          await _controller.logout();
          await Modular.to.pushReplacementNamed(
            '/login/',
          );
        },
      ),
      appBar: CustomAppBar(),
      body: SafeArea(
        child: PageView(
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                        'Characters',
                        style: GoogleFonts.cabin(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.defaultBlack),
                      )),
                    ),
                    Observer(
                      builder: (_) {
                        return _controller.characters.status == Status.loading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _controller.characters.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Material(
                                      color: ColorsApp.defaultBlack,
                                      borderRadius: BorderRadius.circular(20.0),
                                      elevation: 10,
                                      child: ListTile(
                                        title: Center(
                                          child: Text(
                                            "${_controller.characters.data![index].name}",
                                            style: GoogleFonts.cabin(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                        trailing: const Icon(null),
                                        leading: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SizedBox(
                                            width: 30,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                '${_controller.characters.data![index].img}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          await Modular.to.pushNamed(
                                              '/characters/',
                                              arguments: _controller
                                                  .characters.data![index]);
                                        },
                                      ),
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
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return AppButtonSeasons(
                              buttonTitle: 'Season: ${index + 1}',
                              buttonFunction: () async {
                                await Modular.to.pushNamed(
                                  '/season/',
                                  arguments: _controller
                                      .returnSelectedSeasonEpisodes(index + 1),
                                );
                              },
                            );
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
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
                selectedItemColor: ColorsApp.defaultYellow,
                backgroundColor: ColorsApp.defaultBlack,
                currentIndex: _controller.bottomSelectedIndex,
                onTap: (index) {
                  _controller.bottomSelectedIndex = index;
                  _controller.pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeIn);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Characters'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list,
                      ),
                      label: 'Seasons')
                ]),
          ),
        );
      }),
    );
  }
}
