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

const List<Map<String, String>> questions = [
  {"bot": "Hello", "human": "Good afternoon"},
  {"bot": "Welcome to the restaurant", "human": "Thank you"},
  {"bot": "What would you like?", "human": "I would like a tea"},
  {"bot": "Would you like some food?", "human": "A fish please"},
  {"bot": "Anything else?", "human": "Yes, with grilled vegetables"},
  {"bot": "Would you like some water?", "human": "Yes, please"}
];


// const List<String> questions = [
//   "hello world",
//   "how are you",
//   "where are you from",
//   "Would you like some food?",
//   "Would you like some water?"
// ];
