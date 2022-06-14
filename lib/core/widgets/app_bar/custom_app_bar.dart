import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: AppBar(
        iconTheme: IconThemeData(
        size: 36,
        color: ColorsApp.defaultBlack,
      ),
        backgroundColor: ColorsApp.defaultYellow,
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
              child: Hero(
              tag: "logo",
              child: Image.asset(
                  'images/logo.png'),
            )),
        ),

      ),
    );
  }
}
