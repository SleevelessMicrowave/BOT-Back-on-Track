import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);


  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,

        children: <Widget>[
          Positioned(
            child: Image.asset(
                "assets/images/clear.png", height: size.height * 0.45),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/top2.png", height: size.height * 0.25),

          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/bottom2.png", height: size.height*0.3),
          ),
          child,
        ],
      ),
    );
  }
}