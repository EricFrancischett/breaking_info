import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  Modular.to.canPop() ? IconButton(
        onPressed: () {
          Modular.to.pop();
        }, 
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
        ),
      ): null,
      title: const FlutterLogo(),
    );
  }
}
