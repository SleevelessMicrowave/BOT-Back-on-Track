import 'package:bot_back_on_track/Screens/FitnessQuiz/FitnessQuiz.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Assessment extends StatelessWidget {
  final AnimationController animationController;

  Assessment({
    Key key,
    @required this.size,
    @required this.animationController,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset.zero,
      ).animate(animationController),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xFFededed),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "New Symptoms?",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: size.height * 0.001,
            ),
            Text.rich(
              TextSpan(
                  text: "Take another assessment!",
                  style: TextStyle(color: kPrimaryColor, fontSize: 15),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FitnessQuiz();
                          },
                        ),
                      );
                    }),
            ),
            Text.rich(
              TextSpan(
                  text: "Recovered?",
                  style: TextStyle(color: kPrimaryColor, fontSize: 15),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Recovered();
                          },
                        ),
                      );
                    }),
            )
          ],
        ),
      ),
    );
  }
}
