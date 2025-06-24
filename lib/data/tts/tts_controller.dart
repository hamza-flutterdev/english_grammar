import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class TTSController extends GetxController {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void onInit() {
    super.onInit();
    _initTTS();
  }

  Future<void> _initTTS() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);

    List<dynamic> voices = await _flutterTts.getVoices;

    for (var voice in voices) {
      if (voice is Map && voice['name'] == 'en-us-x-tpd-network') {
        final castedVoice = voice.map(
          (k, v) => MapEntry(k.toString(), v.toString()),
        );
        await _flutterTts.setVoice(castedVoice);
        break;
      }
    }
  }

  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  @override
  void onClose() {
    _flutterTts.stop();
    super.onClose();
  }
}
