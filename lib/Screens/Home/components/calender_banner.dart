import 'package:bot_back_on_track/Screens/Calendar.dart';
import 'package:bot_back_on_track/constants.dart';
import 'package:flutter/gestures.dart';
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
            width: double.infinity,
            height: 200,

            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Calendar",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(height: 7),
                Text.rich(
                  TextSpan(
                    text: "update calendar\n",
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 19, color: Colors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return CalendarPage();
                            },
                          ),
                        );
                      }
                  ),

                ),
              ],
            ),
          ),
          /*child: Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget> [

                  RaisedButton(
                      color: kPrimaryLightColor,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CalendarPage()),
                        );
                      }

                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: "Date\n",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          /*child: Column(
            children: [
              RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
                  }
              ),
              Container(

                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),margin: EdgeInsets.symmetric(
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
            ],
          ),*/
        );

    //);
  }
}