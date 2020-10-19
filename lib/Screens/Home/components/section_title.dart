import 'package:bot_back_on_track/Screens/Description/description.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 19)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Description();
                  },
                ),
              );
            },
            child: Text("Learn More", style: TextStyle(color: kPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
