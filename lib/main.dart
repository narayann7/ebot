import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum TtsState { playing, stopped, paused, continued }

class _MyAppState extends State<MyApp> {
  late FlutterTts flutterTts;
  final String _newVoiceText = "hello world";
  TtsState ttsState = TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
    _speak();
  }

  initTts() {
    flutterTts = FlutterTts();
    _setAwaitOptions();
    _getDefaultEngine();
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      log(engine);
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);

    if (_newVoiceText.isNotEmpty) {
      await flutterTts.speak(_newVoiceText);
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
