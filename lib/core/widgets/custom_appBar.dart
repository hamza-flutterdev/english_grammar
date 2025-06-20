import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'icon_buttons.dart';

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
                    size: 30,
                  );
                },
              ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          subtitle,
          style: context.textTheme.titleMedium?.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
