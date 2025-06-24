import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'icon_buttons.dart';
import '../constants/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String subtitle;
  final bool useBackButton;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    super.key,
    required this.subtitle,
    this.useBackButton = true,
    this.actions,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarBgColor,
      centerTitle: true,
      leading:
          useBackButton
              ? BackIconButton()
              : Builder(
                builder: (context) {
                  return IconActionButton(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    icon: Icons.menu,
                    color: kWhite,
                    size: secondaryIcon(context),
                  );
                },
              ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          subtitle,
          style: titleBoldMediumStyle.copyWith(color: kWhite),
        ),
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
