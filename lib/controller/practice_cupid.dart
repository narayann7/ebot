import 'dart:developer';
import 'package:ebot/model/pratice_state.dart';
import 'package:ebot/utility/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class PracticeCupid extends Cubit<PraticeState> {
  PracticeCupid() : super(PraticeState.initial());
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  final _speech = SpeechToText();

  toggleRecording() async {
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    final isAvailable = await _speech.initialize(
      onStatus: (status) {
        emit(state.copyWith(onLinstening: _speech.isListening));
        if (state.onLinstening == false) {
          emit(state.copyWith(
              currentUserText: state.currentUserTempText,
              currentUserTempText: "say something"));
        }
      },
      onError: (e) => log('Error: $e'),
    );

    if (isAvailable) {
      _speech.listen(onResult: (value) {
        emit(state.copyWith(currentUserTempText: value.recognizedWords));
      });
    }

    return isAvailable;
  }

  startPractice() async {
    try {
      flutterTts = FlutterTts();
      await flutterTts.awaitSpeakCompletion(true);
      var engine = await flutterTts.getDefaultEngine;
      if (engine != null) {
        log(engine);
      }
      await botSpeak();
    } catch (e) {}
  }

  botSpeak() async {
    if (state.botWillSpeak) {
      var botText = questions[state.botIndex]['bot'];
      await speak(botText as String);
      emit(state.copyWith(
        botIndex: state.botIndex + 1,
        botWillSpeak: false,
      ));
    }
  }

  userHasSpoken() async {
    emit(state.copyWith(
        userIndex: state.userIndex + 1,
        showSuggestion: false,
        botWillSpeak: true));

    botSpeak();
  }

  Future speak(String text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future stopPractice() async {
    await flutterTts.stop();
  }
}
