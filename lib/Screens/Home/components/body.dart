import 'package:bot_back_on_track/Screens/Home/components/assessment.dart';
import 'package:bot_back_on_track/Screens/Home/components/calender_banner.dart';
import 'package:bot_back_on_track/Screens/Home/components/for_you.dart';
import 'package:bot_back_on_track/Screens/Home/components/section_title.dart';
import 'package:bot_back_on_track/Screens/Home/components/welcome_banner.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.forward();

    //..repeat(reverse: true);
    /*_offsetAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ));

       */
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.03),
            WelcomeBanner(animationController: _animationController,),
            SizedBox(height:size.height*0.02),
            ForYou(/*size: size, animationController: _animationController,*/),
            SizedBox(height:size.height*0.02),

            CalenderBanner(/*animationController: _animationController,*/),
            SizedBox(height:size.height*0.02),
            Assessment(size: size, animationController: _animationController,),

          ],
        ),
      ),
    );
  }
}

