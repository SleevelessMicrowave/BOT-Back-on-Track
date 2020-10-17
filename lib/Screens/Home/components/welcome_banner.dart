import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';


class WelcomeBanner extends StatelessWidget {

  final AnimationController animationController;

  WelcomeBanner({
    @required this.animationController,

});

    @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0,-1),
          end: Offset.zero,
        ).animate(animationController),
      child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 85,
            vertical: 20,
          ),
          width:double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFFededed),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text.rich(
            TextSpan(
              text: "Welcome Back",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
    );
  }
}
