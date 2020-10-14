import 'package:bot_back_on_track/Screens/Login/login_screen.dart';
import 'package:bot_back_on_track/Screens/Welcome/welcome_screen.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Raleway',
      ),
      home: LoginScreen(),
    );
  }

  //SystemChrome.setEnabledSystemUIOverlays([]);
}
