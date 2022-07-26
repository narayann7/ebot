import 'package:ebot/view/dashboard.dart';
import 'package:ebot/view/error.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Dashborad.routeName:
        return Dashborad.getNavigator();

      case "/ErrorScreen":
        return MaterialPageRoute(builder: (c) => const ErrorScreen());

      default:
        return MaterialPageRoute(builder: (c) => const ErrorScreen());
    }
  }
}
