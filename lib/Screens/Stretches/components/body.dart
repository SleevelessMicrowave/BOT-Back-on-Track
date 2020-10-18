import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<String> list = new List<String>();
    List<String> img = new List<String>();
    for(var item in ouchList.ouchies)
    {
      if (item == "Ankle Pain") {
        list.add("Ankle circles, achilles stretch, towel stretch");
        img.add("assets/images/anklestretch.jpg");
      }
      if (item == "Calf Pain") {
        list.add("Simple home treatments like R.I.C.E. (rest, ice, compress, elevate), or over-the-counter anti-inflammatory medication can help.");
        img.add("assets/images/musclestretch.png");
      }
      if (item == "Elbow Pain") {
        list.add("Wrist range of motion, Wrist flexor stretch, Elbow range of motion");
        img.add("assets/images/elbowstretch.jpg");
      }
      if (item == "Finger Pain") {
        list.add("Open to fist stretch, finger touches, tendon glides");
        img.add("assets/images/fingerpain.jpg");
      }
      if (item == "Foot Pain")
      {
        list.add("Roll out the foot, Use foot pads to prevent rubbing on the affected area, Elevate the foot that’s causing you to have pain. Rest your foot as much as possible.");
        img.add("assets/images/footstretch2.jpg");
      }
      if (item == "Knee Pain")
        {
          list.add("Calf stretch with knee bent and straight, Standing hip flexor stretch, Standing hip external rotator stretch, Piriformis stretch");
          img.add("assets/images/kneestretch.jpg");
        }
      if (item == "Shoulder Pain")
        {
          list.add("Cross neck stretch, Shoulder stretch, Tricep stretch");
          img.add("assets/images/shoulderstretch.jpg");
        }


    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Stretches"),
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
                      SizedBox(height:10),
                      Text.rich(
                        TextSpan(
                            text: ouchList.ouchies[i],
                            style: TextStyle(fontSize: 30),

                        ),


                      ),
                      SizedBox(height: 10,),
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
                      SizedBox(height:10),
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

