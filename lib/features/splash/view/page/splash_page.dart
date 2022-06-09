import 'package:breaking_info/features/splash/view/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  SplashPage({ Key? key }) : super(key: key);

  final _controller = Modular.get<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkIfTokenExistsAndIsValid();
          return const FlutterLogo();
        }),
      ),
    );
  }
}