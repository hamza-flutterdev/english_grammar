import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {

  final String title;
  final double textSize;
  final FontWeight? textWeight;
  final Color textColor;
  final IconButton? leadingIcon;
  final IconButton? actionIcon;


  const CustomAppBar({
    super.key,
    required this.title,
    required this.textSize,
    this.textWeight,
    required this.textColor,
    this.leadingIcon, this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      leading: leadingIcon,
      backgroundColor: Color(0XFF25abc7),
      title: Text(title,
        style: TextStyle(color: textColor, fontSize: textSize, fontWeight: textWeight),
      ),
      centerTitle: true,
      actions: [
        if (actionIcon != null) actionIcon!,
        SizedBox(width: 10,),
      ],
    );
  }
}