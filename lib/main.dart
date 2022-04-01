import 'package:flutter/material.dart';
import 'package:foodme/constant/routeconfiguration.dart';
import 'package:foodme/ui/screens/homescreen/homescreen.dart';
import 'package:foodme/ui/screens/loginscreen/loginscreen.dart';
import 'package:foodme/ui/screens/welcomescreen/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home:const WelcomeScreen(),
    );
  }
}
