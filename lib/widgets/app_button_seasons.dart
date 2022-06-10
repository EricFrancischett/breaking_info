import 'package:breaking_info/core/generics/resource.dart';
import 'package:flutter/material.dart';

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
        child: Container(
          color: Colors.amber,
          width: 300,
          height: 50,
          child: Center(
            child: Text(
              buttonTitle,
            ),
          ),
        ),
      ),
    );
  }
}
