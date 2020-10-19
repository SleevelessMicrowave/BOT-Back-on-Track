import 'package:bot_back_on_track/Screens/Home/home_screen.dart';
import 'package:bot_back_on_track/Screens/Login/components/background.dart';
import 'package:bot_back_on_track/Screens/Signup/signup_screen.dart';
import 'package:bot_back_on_track/Screens/Welcome/welcome_screen.dart';
import 'package:bot_back_on_track/components/already_have_an_account_check.dart';
import 'package:bot_back_on_track/components/rounded_button.dart';
import 'package:bot_back_on_track/components/rounded_input_field.dart';
import 'package:bot_back_on_track/components/rounded_password_field.dart';
import 'package:bot_back_on_track/components/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bot_back_on_track/components/google_sign_in_button.dart';

import '../../../constants.dart';
import '../../../googleSignIn.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  SignIn createState() => SignIn();
}

class SignIn extends State<Body> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
              controller: emailController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            Row(
              children: <Widget>[
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    signInWithEmailPassword();
                  },
                ),
                GoogleSignIn(
                  press: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
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

  void signInWithEmailPassword() async {
    //bool success = false;
    FirebaseAuth user;
    try {
      print("here0");

      user = (await mAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)) as FirebaseAuth;
      print("here");

      //success = true;
    } catch (e) {
      print(e.toString());
      print("here2");
      print(user);
      if (true) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
        );
      }
    }
  }
}
