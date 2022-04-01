import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodme/ui/screens/homescreen/homescreen.dart';
import 'package:foodme/ui/screens/signupscreen/signupscreen.dart';
import 'package:foodme/ui/screens/welcomescreen/welcomescreen.dart';

import '../ui/screens/loginscreen/loginscreen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();

      default:
        return error();
    }
  }
}

Route error() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
