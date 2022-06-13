import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Modular.to.canPop()
          ? IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              ),
            )
          : null,
      centerTitle: true,
      titleSpacing: 1,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 90,
            child: Image.asset(
                'lib/Assets/10302--Ns-R98aXvUcxE5evzUBz-pUdmp0eS7q-cropped-1x1-browser 1 (1).png')),
      ),
    );
  }
}
