import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/features/splash/view/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final _controller = Modular.get<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.defaultYellow,
      body: Observer(builder: (_) {
        _controller.checkIfTokenExistsAndIsValid();
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Image.asset(
                  "images/logo.png",
                  width: 300,
                  height: 300,
                ),
              ),
              Image.asset(
                "images/breaking_info.png",
                width: 300,
                height: 300,
              ),
            ],
          ),
        );
      }),
    );
  }
}
