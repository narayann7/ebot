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
const Color gold = Color(0xffd8a01f);
const Color bg = Color(0xff030e21);
const Color bg2 = Color(0xff1A1A2B);

const List<Map<String, String>> questions = [
  {"bot": "Hello", "user": "Good afternoon"},
  {"bot": "Welcome to the restaurant", "user": "Thank you"},
  {"bot": "What would you like?", "user": "I would like a tea"},
  {"bot": "Would you like some food?", "user": "A fish please"},
  {"bot": "Anything else?", "user": "Yes, with grilled vegetables"},
  {"bot": "How are you?", "user": "i am good"},
  {"bot": "How is life?", "user": "life is mixture of happiness and saddness"},
];


// const List<String> questions = [
//   "hello world",
//   "how are you",
//   "where are you from",
//   "Would you like some food?",
//   "Would you like some water?"
// ];
