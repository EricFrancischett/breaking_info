import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'features/login/view/page/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Flutter Demo',
    );
  }
}