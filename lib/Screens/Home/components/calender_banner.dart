import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';


class CalenderBanner extends StatefulWidget {
  CalenderBanner({Key key}): super (key: key);

  @override
  _CalenderBannerState createState() => _CalenderBannerState();
}

  /*
  final AnimationController animationController;
  CalenderBanner({
    //@required this.animationController,
});*/
  class _CalenderBannerState extends State<CalenderBanner>
      with TickerProviderStateMixin {
    AnimationController _controller;
    Animation<double> _animation;

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      );
      _controller.forward();
      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      );
    }

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }
  @override
  Widget build(BuildContext context) {
    /*return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0,1),
        end: Offset.zero,
      ).animate(animationController),*/
      return ScaleTransition(
        scale: _animation,
        child: Container(

          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text.rich(
            TextSpan(
              text: "Date\n",
              style: TextStyle(fontSize: 30),
            ),

          ),

        ),
      );//,
    //);
  }
}