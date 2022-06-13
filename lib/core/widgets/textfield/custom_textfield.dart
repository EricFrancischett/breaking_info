import 'package:breaking_info/core/theme/colors/colors_app.dart';
import 'package:breaking_info/core/theme/fonts/fonts_app.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final IconButton? suffixIcon;
  final bool isObscure;
  final Function(String)? onChanged;
  final int? maxLength;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.isObscure = false,
    this.onChanged,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      style: FontsApp.mainFontText20.copyWith(color: ColorsApp.defaultWhite),
      cursorColor: ColorsApp.defaultYellow,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        counter: const Offstage(),
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        labelStyle: FontsApp.mainFontText20.copyWith(color: ColorsApp.defaultWhite),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          borderSide: BorderSide(
            width: 2,
            color: ColorsApp.defaultWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          borderSide: BorderSide(
            width: 2,
            color: ColorsApp.defaultYellow,
          ),
        ),
      ),
    );
  }
}