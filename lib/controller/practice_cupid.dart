import 'dart:developer';

import 'package:ebot/model/pratice_state.dart';
import 'package:ebot/utility/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PracticeCupid extends Cubit<PraticeState> {
  PracticeCupid() : super(PraticeState.initial());
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;

  startPractice() async {
    try {
      await _initTts();
      for (int i = 0; i < questions.length; i++) {
        await speak(
          questions[i],
        );
      }
    } catch (e) {}
  }

  Future speak(String text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  _initTts() async {
    flutterTts = FlutterTts();
    await flutterTts.awaitSpeakCompletion(true);
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      log(engine);
    }
  }

  Future stopPractice() async {
    await flutterTts.stop();
  }
}
