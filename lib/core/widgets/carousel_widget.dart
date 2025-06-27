import 'package:english_grammer/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_grammer/core/constants/constant.dart';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:english_grammer/core/theme/app_styles.dart';
import '../enums/enums.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> items;
  final List<String>? urduTitles, imgPath;
  final CarouselSliderController carouselController;
  final Function(int) onIndexChanged;
  final Function(int)? onItemTap;
  final List<Color>? containerColors,
      iconColors,
      titleTextColors,
      urduTextColors;
  final List<TextStyle>? titleTextStyles, urduTextStyles;
  final int currentIndex;
  final bool autoPlay, enlargeCenterPage, enableInfiniteScroll, smallerIcons;
  final double? height;
  final double viewportFraction;
  final EdgeInsets? itemMargin;
  final int? selectedIndex;
  final IconPosition iconPosition;
  final TextStyle? titleTextStyle, urduTextStyle;

  const CarouselWidget({
    super.key,
    required this.items,
    this.urduTitles,
    required this.carouselController,
    required this.onIndexChanged,
    this.onItemTap,
    required this.currentIndex,
    this.autoPlay = false,
    this.height,
    this.viewportFraction = 0.65,
    this.enlargeCenterPage = true,
    this.itemMargin,
    this.enableInfiniteScroll = true,
    this.selectedIndex,
    this.imgPath,
    this.containerColors,
    this.iconColors,
    this.smallerIcons = false,
    this.iconPosition = IconPosition.bottom,
    this.titleTextStyle,
    this.urduTextStyle,
    this.titleTextStyles,
    this.urduTextStyles,
    this.titleTextColors,
    this.urduTextColors,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: items.length,
      options: CarouselOptions(
        height: height,
        autoPlay: autoPlay,
        autoPlayInterval: const Duration(seconds: 3),
        aspectRatio: 16 / 9,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        enableInfiniteScroll: enableInfiniteScroll,
        scrollPhysics: const BouncingScrollPhysics(),
        onPageChanged: (index, _) => onIndexChanged(index),
      ),
      itemBuilder:
          (context, index, _) => CarouselItemWidget(
            item: items[index],
            urduTitle: urduTitles?[index],
            index: index,
            imgPath: imgPath?[index],
            isSelected: selectedIndex == index,
            containerColor:
                containerColors?.elementAt(index) ??
                primaryColor.withValues(alpha: 0.7),
            iconColor: iconColors?.elementAt(index),
            smallerIcons: smallerIcons,
            iconPosition: iconPosition,
            titleTextStyle: _getStyle(
              titleTextStyles,
              titleTextColors,
              titleTextStyle,
              index,
            ),
            urduTextStyle: _getStyle(
              urduTextStyles,
              urduTextColors,
              urduTextStyle,
              index,
            ),
            onTap: onItemTap != null ? () => onItemTap!(index) : null,
          ),
    );
  }

  TextStyle _getStyle(
    List<TextStyle>? styles,
    List<Color>? colors,
    TextStyle? base,
    int index,
  ) {
    if (styles != null && styles.length > index) return styles[index];
    if (colors != null && colors.length > index) {
      return (base ?? titleBoldMediumStyle).copyWith(color: colors[index]);
    }
    return base ?? titleBoldMediumStyle.copyWith(color: kWhite);
  }
}

class CarouselItemWidget extends StatelessWidget {
  final String item;
  final String? urduTitle, imgPath;
  final int index;
  final bool isSelected, smallerIcons;
  final Color containerColor;
  final Color? iconColor;
  final IconPosition iconPosition;
  final TextStyle titleTextStyle, urduTextStyle;
  final VoidCallback? onTap;

  const CarouselItemWidget({
    super.key,
    required this.item,
    this.urduTitle,
    required this.index,
    this.imgPath,
    required this.isSelected,
    required this.containerColor,
    required this.iconColor,
    required this.smallerIcons,
    required this.iconPosition,
    required this.titleTextStyle,
    required this.urduTextStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: kHorizontalMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: containerColor, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: roundedDecoration.copyWith(
              color: containerColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isSelected ? primaryColor : AppColors.transparent,
                width: isSelected ? 1.0 : 0.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kElementInnerGap),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: kElementInnerGap),
                  if (iconPosition == IconPosition.top && imgPath != null) ...[
                    CarouselIconWidget(
                      imgPath: imgPath!,
                      iconColor: iconColor,
                      smallerIcons: smallerIcons,
                    ),
                    const SizedBox(height: kElementInnerGap),
                  ],
                  CarouselTextWidget(
                    title: item,
                    urduTitle: urduTitle,
                    titleTextStyle: titleTextStyle,
                    urduTextStyle: urduTextStyle,
                  ),
                  if (iconPosition == IconPosition.bottom &&
                      imgPath != null) ...[
                    const SizedBox(height: kElementInnerGap),
                    CarouselIconWidget(
                      imgPath: imgPath!,
                      iconColor: iconColor,
                      smallerIcons: smallerIcons,
                    ),
                  ],
                  const SizedBox(height: kElementInnerGap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselIconWidget extends StatelessWidget {
  final String imgPath;
  final Color? iconColor;
  final bool smallerIcons;

  const CarouselIconWidget({
    super.key,
    required this.imgPath,
    required this.iconColor,
    required this.smallerIcons,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      imgPath,
      height: primaryIcon(context),
      fit: BoxFit.fitHeight,
    );
    final filtered =
        iconColor != null
            ? ColorFiltered(
              colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
              child: image,
            )
            : image;
    return smallerIcons ? Center(child: filtered) : Expanded(child: filtered);
  }
}

class CarouselTextWidget extends StatelessWidget {
  final String title;
  final String? urduTitle;
  final TextStyle titleTextStyle, urduTextStyle;

  const CarouselTextWidget({
    super.key,
    required this.title,
    this.urduTitle,
    required this.titleTextStyle,
    required this.urduTextStyle,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Center(
        child: Text(title, textAlign: TextAlign.center, style: titleTextStyle),
      ),
      if (urduTitle != null) ...[
        const SizedBox(height: kElementInnerGap),
        Text(urduTitle!, textAlign: TextAlign.center, style: urduTextStyle),
      ],
    ],
  );
}
