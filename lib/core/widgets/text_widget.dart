

import 'package:flutter/cupertino.dart';

Widget regularText({
  required String textTitle,
  required double textSize,
  Color? textColor,
  FontWeight? textWeight,
  TextAlign? textAlign
}){
  return Text(
    textAlign: textAlign,
  textTitle,
    style: TextStyle(
      fontSize: textSize,
      fontWeight:textWeight ,
      color: textColor,
      fontFamily: 'Poppins'
    ),
  );
}