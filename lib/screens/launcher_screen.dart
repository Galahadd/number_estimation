import 'package:flutter/material.dart';
import 'package:number_estimation/screens/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class LauncherScreen extends StatefulWidget {
  @override
  _LauncherScreenState createState() => new _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text('Number Estimation',
        style: new TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: new Image.asset('assets/2.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200.0,
      onClick: ()=>print("Lauch etti"),
      loaderColor: Colors.red,
    );
  }
}