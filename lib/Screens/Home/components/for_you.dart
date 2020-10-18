import 'package:bot_back_on_track/Screens/Home/components/section_title.dart';
import 'package:bot_back_on_track/Screens/Stretches/stretches.dart';
import 'package:flutter/material.dart';


class ForYou extends StatefulWidget {
  ForYou({
    Key key,
    //@required this.size,

  }) : super(key: key);

  //final Size size;

  @override
  _ForYouState createState() => _ForYouState();
}
class _ForYouState extends State<ForYou>
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
    Size size = MediaQuery.of(context).size;
    return ScaleTransition(
      scale: _animation,
      child: Column(
        children: [
          SectionTitle(
            text: "Recommended For You",
            press: (){},
          ),
          SizedBox(height: size.height * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Recommended(
                  size: size,
                  image: "assets/images/stretches2.jpg",
                  category: "Stretches",
                  press: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Stretches();
                        },
                      ),
                    );
                  },
                ),
                Recommended(
                  size: size,
                  image: "assets/images/exercising2.jpg",
                  category: "Exercises",
                  press: (){},
                ),
                Recommended(
                  size: size,
                  image: "assets/images/food.jpg",
                  category: "Nutrition",
                  press: (){},
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  const Recommended({
    Key key,
    @required this.size,
    @required this.category,
    @required this.image,
    @required this.press,
  }) : super(key: key);

  final Size size;
  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: size.width*0.6,
          height: size.height*0.2,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    category,
                    style: TextStyle(fontSize: 20, color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

