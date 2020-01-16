import 'package:flutter/material.dart';
import 'package:number_estimation/screens/launcher_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(body1: TextStyle(color: Color(0xFFFFFFFF))),
        accentColor: Colors.grey,
      ),
      home: LauncherScreen(),

    );
  }
}