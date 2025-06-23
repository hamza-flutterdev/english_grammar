import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int minLines;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final InputBorder border;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Color? cursorColor;
  final Color? backgroundColor;

  const CommonTextField({
    super.key,
    required this.controller,
    this.hintText = 'Enter text...',
    this.minLines = 1,
    this.maxLines = 1,
    this.contentPadding = const EdgeInsets.all(kBodyHp),
    this.hintStyle,
    this.textStyle,
    this.border = InputBorder.none,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.cursorColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedDecoration.copyWith(
        color: backgroundColor ?? kWhite.withValues(alpha: 0.2),
      ),

      child: TextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              hintStyle ?? bodyBoldSmallStyle.copyWith(color: primaryColor),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
        ),
        style: textStyle ?? bodyBoldSmallStyle.copyWith(color: primaryColor),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
