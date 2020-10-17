import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';

class GoogleSignIn extends StatelessWidget {
  final Function press;
  final Color color, textColor;
  const GoogleSignIn({
    Key key,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
      width: size.width * 0.17,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            color: color,
            onPressed: press,
            child: Image.asset('assets/images/googleSignIn.webp',
                height: (size.height * 0.03))),
      ),
    );
  }
}
