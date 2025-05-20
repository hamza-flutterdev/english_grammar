import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child:Icon(Icons.arrow_back_ios_new,color: Colors.white,)
    );
  }
}



class NotificationIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Image.asset(
        'images/notifications.png',
      ),
    );
  }
}

class MoonIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const MoonIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'images/moon_icon.png',
      ),
    );
  }
}

class TrIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const TrIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'images/try_icon.png',
      ),
    );
  }
}

class compaignIconButton extends StatelessWidget {
  const compaignIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'images/Compaigns.svg',
      ),
    );
  }
}
class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'images/menu_icon.svg',
        height: 20,
        width: 20,
      ),
    );
  }
}