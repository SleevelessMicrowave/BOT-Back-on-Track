import 'package:bot_back_on_track/Screens/Login/components/background.dart';
import 'package:bot_back_on_track/Screens/Signup/signup_screen.dart';
import 'package:bot_back_on_track/Screens/Welcome/welcome_screen.dart';
import 'package:bot_back_on_track/components/already_have_an_account_check.dart';
import 'package:bot_back_on_track/components/rounded_button.dart';
import 'package:bot_back_on_track/components/rounded_input_field.dart';
import 'package:bot_back_on_track/components/rounded_password_field.dart';
import 'package:bot_back_on_track/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:bot_back_on_track/components/google_sign_in_button.dart';

import '../../../constants.dart';
import '../../../googleSignIn.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "WELCOME TO BOT",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset("assets/images/bot2.png", height: size.height * 0.4),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            GoogleSignIn(text: "Google Sign In", press: () {}),
            RoundedButton(
              text: "LOGIN",
              press: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  }
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
