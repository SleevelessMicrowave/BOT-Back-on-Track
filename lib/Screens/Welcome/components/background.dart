import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  })   : super(key: key);




  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,

        children: <Widget>[
          Positioned(

            child: Image.asset("assets/images/bot.png", height: size.height * 0.45),
          ),
          child,
        ],
      ),
    );
  }

}


