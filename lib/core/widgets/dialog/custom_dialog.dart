import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:breaking_info/core/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String errorMessage;
  final void Function() onPressed;
  const CustomDialog(
      {Key? key, required this.errorMessage, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorsApp.defaultYellow, width: 3),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: ColorsApp.defaultBlack.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: FontsApp.mainFontText24
                      .copyWith(color: ColorsApp.defaultWhite),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onPressed: onPressed,
                  child: Text(
                    "Ok",
                    style: FontsApp.mainFontText24.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsApp.defaultBlack),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
