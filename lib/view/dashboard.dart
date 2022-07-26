import 'package:ebot/utility/common_functiond.dart';
import 'package:flutter/material.dart';

import 'practice_speaking.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({Key? key}) : super(key: key);
  static const String routeName = '/Dashborad';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Dashborad"),
        builder: (c) {
          return const Dashborad();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                teleport(context, PracticeSpeaking.routeName);
              },
              child: const Text("Practice Speaking")),
          ElevatedButton(onPressed: () {}, child: const Text("Conversation ")),
        ],
      )),
    );
  }
}
