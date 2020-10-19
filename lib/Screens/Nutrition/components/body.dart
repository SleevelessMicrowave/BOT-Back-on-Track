import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';
import 'package:flutter/material.dart';

class Monkey extends StatelessWidget {
  var titles = ["Nutrition", "Tip 1", "Tip 2", "Tip 3", "Some More Advice"];
  @override
  Widget build(BuildContext context) {
    List<String> list = new List<String>();
    List<String> img = new List<String>();
    if (true) {
      list.add(
          "Here are some Dietary Do's and Don'ts to put you back on track!");
      img.add("assets/images/nutritionTop.jpg");
    }
    if (true) {
      list.add(
          "Don’t cut back on protein: \n\nContinue including protein with your meals and snacks as it plays a vital role in healing, as well as preserving your muscle mass during periods of immobility. Leucine-rich foods (cheese, meat, fish, nuts, and seeds) are ideal.");
      img.add("assets/images/protein.jpg");
    }
    if (true) {
      list.add(
          "Try more anti-inflammatory foods! \n\nInflammation is part of the healing process, but it’s important to limit foods that contribute to inflammation. You can try soups made with bone broth, ginger, and turmeric, and smoothies made with Greek yogurt, fresh fruit, and cinnamon to reduce inflammation.");
      img.add("assets/images/antiInflammatory.png");
    }
    if (true) {
      list.add(
          "Don't cut back on calories: \n\nYour instinct is probably to cut back on calories since you're no longer working up a sweat every day. Resist that temptation and keep eating at the rate you have been. Your body heals from macro and micronutrients, so you need to keep calories up to keep supplies of nutrients up.");
      img.add("assets/images/calories.jpg");
    }
    if (true) {
      list.add(
          "Make sure you maintain a balanced diet and get plenty of water. You want to supplement your current diet with some extra foods to recover faster, not construct a brand new diet with different proportions of macro and micro nutrients.\n\nAlso remember that you can only see progress with consistency. Stick to your diet plan everyday and you will get better results!");
      img.add("assets/images/balancedDiet.png");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Nutrition"),
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
                        text: titles[i],
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
                            text: list[i] + "\n",
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
