import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/tts/tts_controller.dart';
import 'icon_buttons.dart';

class SpeakButton extends StatelessWidget {
  final String textToSpeak;
  final String? message;
  final Color color;
  final double size;

  const SpeakButton({
    super.key,
    required this.textToSpeak,
    this.message = 'Speak Word',
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final TTSController tts = Get.put(TTSController());

    return Tooltip(
      message: message,
      child: IconActionButton(
        onTap: () => tts.speak(textToSpeak),
        icon: Icons.play_circle,
        color: color,
        size: size,
      ),
    );
  }
}
