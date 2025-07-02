import 'dart:io';

import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import 'package:english_grammer/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'custom_toast.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  get kSkyBlueColor => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: secondaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Image.asset(
                      'assets/images/home-img/tenses.png',
                      height: 80,
                    ),
                  ),
                  Text(
                    'English Grammar',
                    style: headlineMediumStyle.copyWith(color: kWhite),
                  ),
                ],
              ),
            ),
            DrawerTile(
              icon: Icons.more,
              title: 'More Apps',
              onTap: () {
                //   moreApp();
              },
            ),
            Divider(color: primaryColor.withValues(alpha: 0.1)),
            DrawerTile(
              icon: Icons.privacy_tip_rounded,
              title: 'Privacy Policy',
              onTap: () {
                //  privacy();
              },
            ),
            Divider(color: primaryColor.withValues(alpha: 0.1)),
            DrawerTile(
              icon: Icons.star_rounded,
              title: 'Rate Us',
              onTap: () {
                //  rateUs();
              },
            ),
            Divider(color: primaryColor.withValues(alpha: 0.1)),
            DrawerTile(
              icon: Icons.restart_alt,
              title: 'Reset App',
              onTap: () => _showResetConfirmation,
            ),
            Divider(color: primaryColor.withValues(alpha: 0.1)),
          ],
        ),
      ),
    );
  }

  void _showResetConfirmation(BuildContext context) {
    PanaraConfirmDialog.show(
      context,
      title: "Reset App",
      message:
          "Are you sure you want to reset the app? This will clear all your progress and data.",
      confirmButtonText: "Reset",
      cancelButtonText: "Cancel",
      onTapCancel: () {
        Navigator.pop(context);
      },
      onTapConfirm: () async {
        Navigator.pop(context);
        await _resetApp(context);
      },
      panaraDialogType: PanaraDialogType.custom,
      color: primaryColor,
      barrierDismissible: false,
    );
  }

  Future<void> _resetApp(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    ToastHelper.showCustomToast(
      context: context,
      message: "App is being reset.",
      type: ToastificationType.success,
      primaryColor: primaryColor,
      icon: Icons.restart_alt,
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 24, color: textGreyColor),
      title: Text(title, style: titleSmallStyle),
      onTap: onTap,
    );
  }
}
