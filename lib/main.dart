import 'package:bot_back_on_track/Screens/Calendar.dart';
import 'package:bot_back_on_track/Screens/Home/home_screen.dart';
import 'package:bot_back_on_track/Screens/Login/login_screen.dart';
import 'package:bot_back_on_track/Screens/Welcome/welcome_screen.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bot_back_on_track/UI/Path/add_event.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
      routes: {
        "add_event": (_) => AddEventPage(),
      },
    );
  }

  //SystemChrome.setEnabledSystemUIOverlays([]);
}
