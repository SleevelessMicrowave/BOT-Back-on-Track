import 'package:bot_back_on_track/Screens/Login/login_screen.dart';
import 'package:bot_back_on_track/Screens/Signup/signup_screen.dart';
import 'package:bot_back_on_track/Screens/Welcome/components/background.dart';
import 'package:bot_back_on_track/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              "WELCOME BACK",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
           SizedBox(height:size.height*0.03),
            Image.asset("assets/images/bot.png",
            height: size.height * 0.7,
          ),
           RoundedButton(
            text: "LOGIN",
            press: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                  return LoginScreen();
                  },
              ),
            );
            },

          ),
           RoundedButton(
            text: "SIGN UP",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },

          ),
          ],
        ),
      ),
    );
  }
}


