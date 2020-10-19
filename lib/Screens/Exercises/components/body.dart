import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';
import 'package:flutter/material.dart';

class Monkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = new List<String>();
    List<String> img = new List<String>();
    for (var item in Body.bananaList) {
      if (item == "Ankle Pain") {
        list.add("standing heel raises, squat jumps, single-leg balance");
        img.add("assets/images/ankleExercise.jpg");
      }
      if (item == "Calf Pain") {
        list.add(
            "Common exercises to accomplish this include: calf raises, Downward-Facing Dog, straight calf stretches.");
        img.add("assets/images/calfExercises.jpg");
      }
      if (item == "Elbow Pain") {
        list.add("wrist flexion, wrist extension, forearm pronation");
        img.add("assets/images/elbowExercise.jpg");
      }
      if (item == "Finger Pain") {
        list.add("Antagonistic exercises, rock climbing");
        img.add("assets/images/fingerExercise.jpg");
      }
      if (item == "Foot Pain") {
        list.add("Ankle rolls, heel-to-toes reaches, butterfly pose.");
        img.add("assets/images/footExercise.jpg");
      }
      if (item == "Knee Pain") {
        list.add("Ankle rolls, heel-to-toes reaches, butterfly pose.");
        img.add("assets/images/kneeExercises.jpg");
      }
      if (item == "Shoulder Pain") {
        list.add("do military press, lateral raise, plate front raise");
        img.add("assets/images/shoulderExercise.jpg");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercises"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (var i = 0; i < img.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: Body.bananaList[i],
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Recommended: " + list[i] + "\n",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        Image.asset(
                          img[i],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/*
class Listing {
  @override

  Widget getTextWidgets(List<String> strings)
    {
      List<Widget> list = new List<Widget>();
      for (var i = 0; i <strings.length; i++){
        list.add(new Text(strings[i]));
      }
    }
  }*/
