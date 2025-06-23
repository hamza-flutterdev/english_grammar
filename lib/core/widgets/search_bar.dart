import 'package:flutter/material.dart';
import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/common_text_field.dart';
import 'package:english_grammer/core/widgets/icon_buttons.dart';
import '../theme/app_colors.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onSearch;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  const SearchBarField({
    super.key,
    required this.controller,
    required this.onSearch,
    this.backgroundColor = Colors.transparent,
    this.borderColor = primaryColor,
    this.iconColor = kWhite,
    this.textColor = kWhite,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller,
      hintText: 'Enter word to search...',
      textStyle: bodyBoldMediumStyle.copyWith(color: textColor),
      hintStyle: bodyBoldMediumStyle.copyWith(color: textColor),
      cursorColor: textColor,
      backgroundColor: backgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      onChanged: onSearch,
      onSubmitted: onSearch,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(kElementInnerGap),
        child: IconActionButton(
          backgroundColor: borderColor,
          icon: Icons.search,
          color: iconColor,
          onTap: () {
            onSearch(controller.text);
          },
        ),
      ),
    );
  }
}
