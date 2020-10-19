import 'package:bot_back_on_track/Screens/Home/home_screen.dart';
import 'package:bot_back_on_track/Screens/Signup/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

final FirebaseAuth mAuth = FirebaseAuth.instance;

class UserPassSignUp extends StatefulWidget {
  @override
  Page createState() => Page();
}

class Page extends State<UserPassSignUp> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sample Login/SignUp Page")),
        body: Container(
            child: Column(children: <Widget>[
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
          ),
          RaisedButton(
              child: Text("SignUp"),
              onPressed: () {
                signUpWithEmailPassword();
              })
        ])));
  }

  void signUpWithEmailPassword() async {
    User user;
    try {
      user = (await mAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)) as User;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      }
    }
  }
}
