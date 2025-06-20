import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/icon_buttons.dart';

class MenuOptionRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String urduText;
  final String assetPath;
  final Color backgroundColor;
  final VoidCallback onTap;
  final double? iconSize;

  const MenuOptionRow({
    super.key,
    required this.title,
    this.subtitle,
    required this.urduText,
    required this.assetPath,
    required this.backgroundColor,
    required this.onTap,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final mobileWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageActionButton(
          padding: EdgeInsets.all(12),
          onTap: onTap,
          assetPath: assetPath,
          size: iconSize ?? mobileWidth * 0.12,
          isCircular: true,
          backgroundColor: backgroundColor,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(color: kWhite),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: context.textTheme.bodySmall?.copyWith(color: kWhite),
                  ),
              ],
            ),

            Text(
              urduText,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: context.textTheme.bodySmall?.copyWith(
                color: kWhite,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
