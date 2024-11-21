import 'package:ci_task/features/Home_page/Screens/home_page_screen.dart';
import 'package:ci_task/routing/route_constants.dart';
import 'package:flutter/material.dart';

class RouteManager {
  MaterialPageRoute<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homeScreen:
        return MaterialPageRoute(settings: const RouteSettings(name: RouteConstants.homeScreen), builder: (context) => const HomePageScreen());
      default:
        return MaterialPageRoute(settings: const RouteSettings(name: RouteConstants.homeScreen), builder: (context) => const HomePageScreen());
    }
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
