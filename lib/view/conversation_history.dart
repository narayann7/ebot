import 'package:flutter/material.dart';

class SingleConversions extends StatelessWidget {
  const SingleConversions({Key? key}) : super(key: key);
  static const String routeName = '/SingleConversions';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/SingleConversions"),
        builder: (c) {
          return const SingleConversions();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
