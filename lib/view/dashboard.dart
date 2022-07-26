import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text("Dashborad"),
      ),
    );
  }
}
