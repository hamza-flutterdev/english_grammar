import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../controller/dictionary_controller.dart';

class WordDetailSection extends StatelessWidget {
  final DictionaryController controller;
  final String title;
  final String content;

  const WordDetailSection({
    super.key,
    required this.controller,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('• $title', style: titleSmallBoldStyle)],
        ),
        const SizedBox(height: kElementInnerGap),
        Text(content, style: bodyMediumStyle),
      ],
    );
  }
}
