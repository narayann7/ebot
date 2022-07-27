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
      onStatus: (status) async {
        emit(state.copyWith(onLinstening: _speech.isListening));

        if (status == "done" && state.currentUserTempText != "say something") {
          var messages = state.formattedMessages;
          messages.add({"isMe": true, "text": state.currentUserTempText});
          emit(state.copyWith(
              currentUserText: state.currentUserTempText,
              currentUserTempText: "say something",
              formattedMessages: messages));
          log(state.formattedMessages.toString());

          await userHasSpoken();
        }
      },
      onError: (e) => log('Error: $e'),
    );

    if (isAvailable) {
      _speech.listen(onResult: (value) {
        if (value.recognizedWords.isNotEmpty) {
          emit(state.copyWith(currentUserTempText: value.recognizedWords));
        }
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
      final time = await Future.delayed(const Duration(milliseconds: 600))
          .then((value) => DateTime.now());
      await botSpeak();
    } catch (e) {}
  }

  botSpeak() async {
    if (state.botWillSpeak) {
      var botText = questions[state.botIndex]['bot'];
      var messages = state.formattedMessages;
      messages.add({"isMe": false, "text": botText});
      emit(state.copyWith(formattedMessages: messages));
      await speak(botText as String);

      emit(state.copyWith(
        botIndex: state.botIndex + 1,
        botWillSpeak: false,
        currentBotText: botText,
      ));
    }
  }

  userHasSpoken() async {
    final time = await Future.delayed(const Duration(seconds: 1))
        .then((value) => DateTime.now());
    if (questions[state.botIndex - 1]["user"]!.toLowerCase() !=
        state.currentUserText) {
      var messages = state.formattedMessages;
      messages.add({
        "isMe": false,
        "isSuggestion": true,
        "text": questions[state.botIndex - 1]["user"]
      });
    }
    emit(state.copyWith(
        userIndex: state.userIndex + 1,
        showSuggestion: false,
        botWillSpeak: true));

    await botSpeak();
  }

  Future speak(String text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setPitch(1);
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future stopPractice() async {
    await flutterTts.stop();
  }

  makeItIntial() {
    emit(PraticeState.initial());
  }
}
