import 'dart:async';
import 'package:english_grammer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Timer? _timer;
  Timer? _flickerTimer;
  Timer? _letterTimer;

  var showButton = false.obs;
  var urduTextColor = kWhite.obs;
  var visibleLetters = 0.obs;

  bool _colorUpdate = true;
  final String _targetText = 'Learn English';

  final Color _color1 = kWhite;
  final Color _color2 = kWarmGold;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 500), () {
      _animateEnglishTextLetters();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      _startUrduColorAnimation();
    });
    Future.delayed(const Duration(seconds: 4), () {
      showButton.value = true;
    });
  }

  void _animateEnglishTextLetters() {
    _letterTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (visibleLetters.value < _targetText.length) {
        visibleLetters.value++;
      } else {
        _letterTimer?.cancel();
      }
    });
  }

  void _startUrduColorAnimation() {
    urduTextColor.value = _color1;
    _flickerTimer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      if (_colorUpdate) {
        urduTextColor.value = _color2;
      } else {
        urduTextColor.value = _color1;
      }
      _colorUpdate = !_colorUpdate;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    _flickerTimer?.cancel();
    _letterTimer?.cancel();
    super.onClose();
  }
}
