import 'package:ebot/view/conversations.dart';
import 'package:ebot/view/dashboard.dart';
import 'package:ebot/view/error.dart';
import 'package:ebot/view/practice_speaking.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Dashborad.routeName:
        return Dashborad.getNavigator();
      case PracticeSpeaking.routeName:
        return PracticeSpeaking.getNavigator();
      case Conversation.routeName:
        return Conversation
        .getNavigator();

      case "/ErrorScreen":
        return MaterialPageRoute(builder: (c) => const ErrorScreen());

      default:
        return MaterialPageRoute(builder: (c) => const ErrorScreen());
    }
  }
}
