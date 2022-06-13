import 'package:breaking_info/core/generics/resource.dart';
import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonSeasons extends StatelessWidget {
  final String buttonTitle;
  Function() buttonFunction;
  AppButtonSeasons(
      {Key? key, required this.buttonTitle, required this.buttonFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: buttonFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: ColorsApp.defaultBlack,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 10,
          child: ListTile(
            title: Center(
              child: Text(
                "${buttonTitle}",
                style: GoogleFonts.cabin(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
