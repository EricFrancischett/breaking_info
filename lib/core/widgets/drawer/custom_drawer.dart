import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String firstName;
  final String lastName;
  final Function() onPressed;
  const CustomDrawer(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        bottomLeft: Radius.circular(40),
      ),
      child: Drawer(
        backgroundColor: ColorsApp.defaultBlack,
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.defaultBlack,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: ColorsApp.defaultYellow,
                  size: 160,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name:",
                      style: FontsApp.mainFontText24.copyWith(
                        color: ColorsApp.defaultWhite,
                      ),
                    ),
                    Text(
                      firstName,
                      style: FontsApp.mainFontText20.copyWith(
                        color: ColorsApp.defaultWhite,
                      ),
                    ),
                    Text(
                      "Last Name:",
                      style: FontsApp.mainFontText24.copyWith(
                        color: ColorsApp.defaultWhite,
                      ),
                    ),
                    Text(
                      lastName,
                      style: FontsApp.mainFontText20.copyWith(
                        color: ColorsApp.defaultWhite,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.logout_rounded,
                      color: ColorsApp.defaultYellow,
                      size: 40,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
