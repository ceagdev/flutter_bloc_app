import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: 'Second Screen',
            color: Colors.redAccent,
          ),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: 'Third Screen',
            color: Colors.greenAccent,
          ),
        );
        break;
      default:
        return null;
    }
  }

}
