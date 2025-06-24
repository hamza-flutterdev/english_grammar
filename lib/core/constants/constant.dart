import 'package:flutter/material.dart';

/// ========== Fonts ==========
const fontFamily = 'Montserrat';

/// ========== Padding ==========
const double kBodyHp = 16.0;
const double kElementGap = 12.0;
const double kElementInnerGap = 8.0;
const double kElementWidthGap = 8.0;
const kContentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 4);

/// ========== Margins ==========
const kMargin = EdgeInsets.symmetric(vertical: 8);

/// ========== Elevation ==========
const double kCardElevation = 2.0;

/// ========== Border ==========
const double kBorderRadius = 8.0;

/// ========== Icon Sizes ==========
double primaryIcon(BuildContext context) => mobileWidth(context) * 0.1;
double secondaryIcon(BuildContext context) => mobileWidth(context) * 0.07;

/// ========== MediaQuery Helpers ==========
double mobileWidth(BuildContext context) => MediaQuery.of(context).size.width;
double mobileHeight(BuildContext context) => MediaQuery.of(context).size.height;
