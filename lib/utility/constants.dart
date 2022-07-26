import 'package:flutter/material.dart';

enum STATUS {
  initial,
  loading,
  success,
  error,
}

enum CONECTION_STATUS {
  initial,
  connected,
  disconnected,
}

enum TtsState { playing, stopped, paused, continued }

const Color black = Color(0xff000000);

const List<String> questions = [
  "hello world",
  "how are you",
  "where are you from",
  "Would you like some food?",
  "Would you like some water?"
];
