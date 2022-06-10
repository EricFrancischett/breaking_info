import 'package:breaking_info/core/generics/resource.dart';
import 'package:flutter/material.dart';

class AppButtonSeasons extends StatelessWidget {
  final String buttonTitle;
  Function()? buttonFunction;
  AppButtonSeasons({Key? key, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        width: 300,
        height: 50,
      ),
    );
  }
}
