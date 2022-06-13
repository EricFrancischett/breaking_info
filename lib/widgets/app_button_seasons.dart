import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonSeasons extends StatelessWidget {
  final String buttonTitle;
  Function()? buttonFunction;
  Color tileColor;
  Color letterColor;

  AppButtonSeasons(
      {Key? key,
      required this.buttonTitle,
      this.buttonFunction,
      required this.tileColor,
      required this.letterColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: tileColor,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 10,
          child: ListTile(
            title: Center(
              child: Text(
                "${buttonTitle}",
                style: GoogleFonts.cabin(color: letterColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
