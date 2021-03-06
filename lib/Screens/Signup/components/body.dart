import 'package:bot_back_on_track/Screens/Home/home_screen.dart';
import 'package:bot_back_on_track/Screens/Login/login_screen.dart';
import 'package:bot_back_on_track/Screens/Signup/components/background.dart';
import 'package:bot_back_on_track/Screens/Signup/components/or_divider.dart';
import 'package:bot_back_on_track/components/already_have_an_account_check.dart';
import 'package:bot_back_on_track/components/rounded_button.dart';
import 'package:bot_back_on_track/components/rounded_input_field.dart';
import 'package:bot_back_on_track/components/rounded_password_field.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  SignUp createState() => SignUp();
}

class SignUp extends State<Body> {
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
              "SIGNUP",
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
              onChanged: (value) {},
              controller: passwordController,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                signUpWithEmailPassword();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            /*OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kPrimaryLightColor,
                    ),
                    shape: BoxShape.circle,
                  ),

                ),
              ],
            )
            */
          ],
        ),
      ),
    );
  }

  void signUpWithEmailPassword() async {
    //bool success = false;
    FirebaseAuth user;
    try {
      print("here0");
      if (true) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
        );
      }
      user = (await mAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)) as FirebaseAuth;
      print("here");

      //success = true;
    } catch (e) {
      print(e.toString());
      print("here2");
    }
  }
}
