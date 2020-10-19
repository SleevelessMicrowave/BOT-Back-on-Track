import 'package:bot_back_on_track/Screens/FitnessQuiz/components/body.dart';
import 'package:flutter/material.dart';
import 'package:bot_back_on_track/Screens/FitnessQuiz/components/fitnessRemove.dart';

class FitnessQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Recovered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fitnessRemove(),
    );
  }
}

