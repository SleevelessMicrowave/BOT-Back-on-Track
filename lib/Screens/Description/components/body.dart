import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';
import 'package:flutter/material.dart';

class Monkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = new List<String>();
    List<String> img = new List<String>();
    for (var item in Body.bananaList) {
      if (item == "Ankle Pain") {
        list.add(
            "Ankle pain can have causes that aren't due to underlying disease. Examples include poorly fitting footwear such as ski boots and high heels, sprains, strains, overuse, lack of use, or trauma.");
        img.add("");
      }
      if (item == "Calf Pain") {
        list.add(
            "Muscle calf pain usually occur as a result of fatigue, overuse, or improper use of a muscle. Symptoms of a more serious injury include: pain in the back of the leg, swelling, and limited range of motion when flexing your foot.");
        img.add("");
      }
      if (item == "Elbow Pain") {
        list.add(
            "Elbow pain can have causes that aren't due to underlying disease. Examples include prolonged pressure or leaning on elbows, trying a new exercise such as tennis, local trauma, desk work, sprains, or strains.");
        img.add("");
      }
      if (item == "Finger Pain") {
        list.add(
            "Both osteoarthritis and rheumatoid arthritis (RA) commonly affect joints of the fingers. Trauma or injury to the finger, such as bruises, dislocations, and fractures of bone are all common causes of finger pain. Tumors of the structures in the finger are a very rare cause of finger pain.");
        img.add("");
      }
      if (item == "Foot Pain") {
        list.add(
            "Your feet bear weight when you’re standing and help you get where you need to go. Because of this, foot pain is common. Foot pain refers to any pain or discomfort in one or more parts of the foot. Your feet are especially susceptible to the pain that occurs due to arthritis. There are 33 joints in the foot, and arthritis can affect any of them.");
        img.add("");
      }
      if (item == "Knee Pain") {
        list.add(
            "Knee pain can have causes that aren't due to underlying disease. Examples include heavy physical activity, lack of use, injuries such as sprains or strains, sitting in a constrained area, or sitting on knees for a prolonged period.");
        img.add("");
      }
      if (item == "Shoulder Pain") {
        list.add(
            "Physical discomfort of the shoulder, including the joint itself or the muscles, tendons, and ligaments that support the joint.");
        img.add("");
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
                "Disclaimer: Please consult a doctor if you are unsure about anything or if the pain worsens."),
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
                            text: "Description: " + list[i] + "\n",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        //Image.asset(
                        //img[i],
                        //),
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
