import 'package:bot_back_on_track/Screens/Login/login_screen.dart';
import 'package:bot_back_on_track/Screens/Signup/components/background.dart';
import 'package:bot_back_on_track/Screens/Signup/components/or_divider.dart';
import 'package:bot_back_on_track/components/already_have_an_account_check.dart';
import 'package:bot_back_on_track/components/rounded_button.dart';
import 'package:bot_back_on_track/components/rounded_input_field.dart';
import 'package:bot_back_on_track/components/rounded_password_field.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
                "assets/images/bot2.png",
                height: size.height * 0.4
            ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
}




