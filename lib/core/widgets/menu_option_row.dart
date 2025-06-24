import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageActionButton(
            padding: EdgeInsets.all(kElementGap),
            assetPath: assetPath,
            size: iconSize ?? primaryIcon(context),
            isCircular: true,
            backgroundColor: backgroundColor,
          ),
          const SizedBox(width: kElementWidthGap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleSmallBoldStyle.copyWith(color: kWhite),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: bodyMediumStyle.copyWith(color: kWhite),
                    ),
                ],
              ),

              Text(
                urduText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: bodyMediumStyle.copyWith(color: kWhite),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
