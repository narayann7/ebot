import 'package:flutter/material.dart';

class PracticeSpeaking extends StatefulWidget {
  const PracticeSpeaking({Key? key}) : super(key: key);
  static const String routeName = '/PracticeSpeaking';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/PracticeSpeaking"),
        builder: (c) {
          return const PracticeSpeaking();
        });
  }

  @override
  State<PracticeSpeaking> createState() => _PracticeSpeakingState();
}

class _PracticeSpeakingState extends State<PracticeSpeaking> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("PracticeSpeaking"),
      ),
    );
  }
}
