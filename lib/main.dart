import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:linuxcommands_app/main0.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: AnimatedSplashScreen(
            splashIconSize: 400,
            backgroundColor: Colors.black,
            splash: Column(
              children: <Widget>[
                Text(
                  "THE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "LINUX",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "TERMINAL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "APP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 30),
                  child: Icon(
                    Icons.developer_mode,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ],
            ),
            splashTransition: SplashTransition.scaleTransition,
            nextScreen: FirstRoute(),
          ),
        ),
      ),
    );
  }
}
